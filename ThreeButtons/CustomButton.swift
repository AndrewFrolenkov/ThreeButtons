//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Андрей Фроленков on 6.05.23.
//

import UIKit

class CustomButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  convenience init(text: String, frame: CGRect = .zero) {
    self.init(frame: frame)
    
    config(title: text)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func config(title: String) {
    var buttonConfig = UIButton.Configuration.filled()
    buttonConfig.title = title
    buttonConfig.baseForegroundColor = .white
    buttonConfig.image = UIImage(systemName: "arrow.right.circle.fill")
    buttonConfig.imagePlacement = .trailing
    buttonConfig.imagePadding = 8
    buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
    
    self.configuration = buttonConfig
    
  }

  func touchIn() {
    UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn]) {
      self.transform = .init(scaleX: 0.9, y: 0.9)
    }

  }
  func touchEnd() {
    UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
      self.transform = .identity
    }

  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)

    touchIn()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)

    touchEnd()
  }
  
  override func tintColorDidChange() {
    
    if tintAdjustmentMode == .dimmed {
      self.configuration?.background.backgroundColor = .gray
    } else {
      self.configuration?.background.backgroundColor = .systemBlue
    }
  }
  
}
