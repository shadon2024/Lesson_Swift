//
//  ViewController.swift
//  modul_12
//
//  Created by Admin on 27.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constans.Image.play
        imageView.tintColor = traitCollection.userInterfaceStyle == .dark ? .red : .blue
        imageView.tintColor = Constans.Colors.greenPrimary
        return imageView
    }()
    
    private lazy var label1: UILabel = {
        let label = UILabel()
        //label.text = "Heading"
        label.text = Constans.Text.heading
        label.textColor = Constans.Colors.greenPrimary
        label.font = Constans.Fonts.systemHeading
        return label
    }()
    
    private lazy var label2: UILabel = {
        let label = UILabel()
        //label.text = "UI30Semi"
        label.text = Constans.Text.text1
        label.textColor = Constans.Colors.greenSecondary
        label.font = Constans.Fonts.ui30Semi
        return label
    }()
    
    private lazy var label3: UILabel = {
        let label = UILabel()
        //let string = "Hello, world"
        let string = Constans.Text.text2
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        
        if let commaIndex = string.firstIndex(of: ",") {
            attributedString.addAttribute(
                .foregroundColor,
                value: UIColor.systemRed,
                range: NSRange(string.startIndex ..< commaIndex, in: string)
            )
            
            attributedString.addAttribute(
                .foregroundColor,
                value: UIColor.systemBlue,
                range: NSRange(commaIndex ..< string.endIndex, in: string)
            )
        }
        
        //label.attributedText = NSAttributedString(string: "Hello, world")
        label.attributedText = attributedString
      
        return label
    }()

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateImageColor()
    }
    
    
    
    
    // MARK: - Private
    
    private func setupViews() {
        view.addSubview(stackView)
        
    }
    
    private func setupConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalToConstant: 250 ).isActive = true
    }
    
    private func updateImageColor() {
        if traitCollection.userInterfaceStyle == .dark {
            imageView.tintColor = .red
        } else {
            imageView.tintColor = .blue
        }
    }

}

