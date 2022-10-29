//
//  ViewController.swift
//  UIKitApp
//
//  Created by MAcbook on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IB Outlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false) // добавляем новый сегмент
        setupSlider()
        setupMainLabel()
        
    }

// MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first text is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second text is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third text is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        mainLabel.text = inputText
        
        if let _ = Double(inputText) {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
    }
    
    // MARK: - Private Methothds
    
    private func setupMainLabel() {
        
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
    
}


// MARK: - UIAlertController

extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
 }
