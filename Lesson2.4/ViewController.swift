//
//  ViewController.swift
//  Lesson2.4
//
//  Created by Alex Pavlyuk on 1/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets.
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLable: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Here we working on Interface action with segmentedControl.
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupMainLabel()
        setupSlider()
        
    }
    // MARK: - IB Actions.
    
    @IBAction func segmentControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func sliderAction() {
        
        mainLabel.text = "\(slider.value)"
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        
    }
    
    @IBAction func doneButtonPressed () {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please entr your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        mainLabel.text = textField.text
        
    }
    
    // Mark -> сдесь мы работаем с DateFormatter
    
    @IBAction func datePickerAction () {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    // Switch -> работаем над switch
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        switchLable.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    
    // MARK: - Private method.
    private func setupMainLabel() {
        // we have to move here all logical parameters.
        
        mainLabel.text = String(slider.value)
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
    }
    private func setupSlider () {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .blue
    }
}
// Working with UIAlertController.

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
