//
//  ViewController.swift
//  m_12
//
//  Created by Admin on 27.03.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Views
    
    private lazy var labelOne: UILabel = {
        let label = UILabel()
        label.text = Constans.Text.text1
        label.textColor = Constans.Colors.brownColor
        label.font = Constans.Fonts.systemTextFruits
        return label
    }()
    
    private lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = Constans.Text.text2
        label.textColor = Constans.Colors.grayColor
        label.font = Constans.Fonts.systemHeadingFruits
        return label
    }()
    
    
    private lazy var labelThree: UILabel = {
        let label = UILabel()
        //let string = "Peach, pear"
        let string = Constans.Text.text3
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green,
            .backgroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 50)
        ]
        
        label.attributedText = NSAttributedString(string: string, attributes: attributes)

         return label
     }()
    
    private lazy var iconViewOne: UIImageView = {
        let iconViewOne = UIImageView()
        iconViewOne.image = Constans.Icon.icon
        iconViewOne.tintColor = traitCollection.userInterfaceStyle == .dark ? .blue : .red
        iconViewOne.tintColor = Constans.Colors.brownColor
        return iconViewOne
    }()
    
    private lazy var iconViewTwo: UIImageView = {
        let iconViewTwo = UIImageView()
        iconViewTwo.image = Constans.Icon.icon
        iconViewTwo.tintColor = traitCollection.userInterfaceStyle == .dark ? .blue : .red
        iconViewTwo.tintColor = Constans.Colors.grayColor
        return iconViewTwo
    }()
    
    private lazy var iconViewThree: UIImageView = {
        let iconViewThree = UIImageView()
        iconViewThree.image = Constans.Icon.icon
        iconViewThree.tintColor = traitCollection.userInterfaceStyle == .dark ? .blue : .red
        iconViewThree.tintColor = Constans.Colors.violetColor
        return iconViewThree
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(iconViewOne)
        stackView.addArrangedSubview(iconViewTwo)
        stackView.addArrangedSubview(iconViewThree)
        stackView.addArrangedSubview(labelOne)
        stackView.addArrangedSubview(labelTwo)
        stackView.addArrangedSubview(labelThree)
        return stackView
    }()
    
    
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
        stackView.widthAnchor.constraint(equalToConstant: 600 ).isActive = true
    }
    
    
    private func updateImageColor() {
        if traitCollection.userInterfaceStyle == .dark {
            iconViewOne.tintColor = .blue
        } else {
            iconViewOne.tintColor = .red
        }
        
        if traitCollection.userInterfaceStyle == .dark {
            iconViewTwo.tintColor = .blue
        } else {
            iconViewTwo.tintColor = .red
        }
        
        if traitCollection.userInterfaceStyle == .dark {
            iconViewThree.tintColor = .blue
        } else {
            iconViewThree.tintColor = .red
        }
        
    }


}

