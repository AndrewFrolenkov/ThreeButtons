//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Андрей Фроленков on 6.05.23.
//

import UIKit

class ViewController: UIViewController {

  let firstButton: CustomButton = {
    let firstButton = CustomButton(text: "First Button")
    return firstButton
  }()
  
  let secondMediumButton: CustomButton = {
    
    let secondMediumButton = CustomButton(text: "Second Medium Button")
    return secondMediumButton
  }()
  
  let thirdButton: CustomButton = {
    let thirdButton = CustomButton(text: "Third")
    return thirdButton
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupConstraints()

    thirdButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
  }
  
  @objc fileprivate func buttonPressed(sender: UIButton) {
    
    let controller = SecondViewController()
    self.present(controller, animated: true)
  }
  
  func setupConstraints() {
    
    view.addSubview(firstButton)
    view.addSubview(secondMediumButton)
    view.addSubview(thirdButton)
    
    firstButton.translatesAutoresizingMaskIntoConstraints = false
    secondMediumButton.translatesAutoresizingMaskIntoConstraints = false
    thirdButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      secondMediumButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
      secondMediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      thirdButton.topAnchor.constraint(equalTo: secondMediumButton.bottomAnchor, constant: 10),
      thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }

}

