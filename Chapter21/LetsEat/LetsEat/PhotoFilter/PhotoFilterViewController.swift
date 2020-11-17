//
//  PhotoFilterViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 30/10/2020.
//

import UIKit
import AVFoundation
import CoreServices

class PhotoFilterViewController: UIViewController {
    
    var image: UIImage?
    var thumbnail: UIImage?
    let manager = FilterManager()
    var selectedRestaurantID: Int?
    var filters: [FilterItem] = []
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var imgExample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private Extension
private extension PhotoFilterViewController {
    
    func initialize() {
        setupCollectionView()
        checkSource()
    }
    
    func checkSavedPhoto() {
        if let img = self.imgExample.image {
            var item = RestaurantPhotoItem()
            item.photo = generate(image: img, ratio: CGFloat(102))
            item.date = Date()
            item.restaurantID = selectedRestaurantID
            CoreDataManager.shared.addPhoto(item)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 7
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func checkSource() {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        switch cameraAuthorizationStatus {
        case .authorized:
            self.showCameraUserInterface()
        case .restricted, .denied:
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.showCameraUserInterface()
                    }
                }
            }
        }
    }
    
    func showApplyFilter() {
        manager.fetch{ (items) in
            filters = items
            if let image = self.image {
                imgExample.image = image
                collectionView.reloadData()
            }
        }
    }
    
    @IBAction func onPhotoTapped(_ sender: Any) {
        checkSource()
    }
    
    @IBAction func onSaveTapped(_ sender: AnyObject) {
        self.checkSavedPhoto()
    }
    
}

extension PhotoFilterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCell
        let item = self.filters[indexPath.row]
        if let img = self.thumbnail {
            cell.set(image: img, item: item)
        }
        return cell
    }
}

extension PhotoFilterViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect = collectionView.frame.size.height
        let screenHt = screenRect - 14
        return CGSize(width: 150, height: screenHt)
    }
}

extension PhotoFilterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showCameraUserInterface() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        #if targetEnvironment(simulator)
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        #else
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.showsCameraControls = true
        #endif
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        if let img = image {
            self.thumbnail = generate(image: img, ratio: CGFloat(102))
            self.image = generate(image: img, ratio: CGFloat(752))
        }
        picker.dismiss(animated: true){
            self.showApplyFilter()
        }
    }
    
    func generate(image: UIImage, ratio: CGFloat) -> UIImage {
        let size = image.size
        var croppedSize: CGSize?
        var offsetX: CGFloat = 0.0
        var offsetY: CGFloat = 0.0
        if size.width > size.height {
            offsetX = (size.height - size.width) / 2
            croppedSize = CGSize(width: size.height, height: size.height)
        } else {
            offsetY = (size.width - size.height) / 2
            croppedSize = CGSize(width: size.width, height: size.width)
        }
        guard let cropped = croppedSize, let cgImage = image.cgImage else {
            return UIImage()
        }
        let clippedRect = CGRect(x: offsetX * -1, y: offsetY * -1, width: cropped.width, height: cropped.height)
        let imgRef = cgImage.cropping(to: clippedRect)
        let rect = CGRect(x: 0.0, y: 0.0, width: ratio, height: ratio)
        UIGraphicsBeginImageContext(rect.size)
        if let ref = imgRef {
            UIImage(cgImage: ref).draw(in: rect)
        }
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let thumb = thumbnail else {
            return UIImage()
        }
        return thumb
    }
}

extension PhotoFilterViewController: ImageFiltering {
    func filterSelected(item: FilterItem) {
        if let img = image {
            if item.filter != "None" {
                imgExample.image = self.apply(filter: item.filter, originalImage: img)
            } else {
                imgExample.image = img
            }
        }
    }
}

extension PhotoFilterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.filters[indexPath.row]
        filterSelected(item: item)
    }
}
