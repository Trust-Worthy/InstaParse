//
//  PostViewController.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/1/22.
//

import UIKit

// TODO: Import Photos UI
import PhotosUI
// TODO: Import Parse Swift
import ParseSwift

class PostViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var previewImageView: UIImageView!

    private var pickedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPickedImageTapped(_ sender: UIBarButtonItem) {
        // TODO: Pt 1 - Present Image picker
        
        // create configuration obeject
        var config = PHPickerConfiguration()
        
        // set the filter to only show images as options (no vids)
        
        config.filter = .images
        
        // request the original file format. Fastest method because it avoids transcoding
        config.preferredAssetRepresentationMode = .current
        
        // only allow 1 image to be selected at a time
        config.selectionLimit = 1
        
        // Instantiate a picker, passing in the configuration
        let picker = PHPickerViewController(configuration: config)
        
        // set the picker delegate so whatever image the user picks can be received
        picker.delegate = self
        
        // present the picker
        present(picker, animated: true)
    }

    @IBAction func onShareTapped(_ sender: Any) {

        // Dismiss Keyboard
        view.endEditing(true)

        // TODO: Pt 1 - Create and save Post


    }

    @IBAction func onViewTapped(_ sender: Any) {
        // Dismiss keyboard
        view.endEditing(true)
    }

    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

// TODO: Pt 1 - Add PHPickerViewController delegate and handle picked image.

extension PostViewController: PHPickerViewControllerDelegate {
    
    // function to receive the image the user picked to post
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // dismiss the picker
        picker.dismiss(animated: true)
        
        // make sure a non-nil value was provided
        guard let provider = results.first?.itemProvider,
              // make sure the provider can load a UIImage
              provider.canLoadObject(ofClass: UIImage.self) else {return}
        
        // Load a UIImage from the provider
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            
            // Make sure we can cast the returned object to a UIImage
            guard let image = object as? UIImage else {
                
                // unable to cast to UIImage
                self?.showAlert()
                return
            }
            
            // check for and handle any errors
            if let error = error {
                self?.showAlert(description: error.localizedDescription)
                return
            } else {
                // UI updates --> setting image on image view should be done on main thread
                DispatchQueue.main.async {
                    
                    // set image on preview image view
                    self?.previewImageView.image = image
                    
                    // set image to use when saving post
                    self?.pickedImage = image
                }
            }
            
        }
        
        
        
    }
    
}
