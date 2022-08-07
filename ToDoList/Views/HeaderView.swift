//
//  HeaderView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class HeaderView: UIView {
    let greetingLabel = UILabel()
    let statusLabel = UILabel()
    
    func configure() {
        setText()
        
        self.addSubview(statusLabel)
        self.addSubview(greetingLabel)
        
        setConstraints()
    }
    
    private func setText() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        var text = "Welcome back!"
        if hour >= 6 && hour < 11 {
            text = "Good morning!"
        } else if hour >= 12 && hour < 17 {
            text = "Good afternoon!"
        } else if hour >= 17 && hour < 23 {
            text = "Good evening!"
        } else if hour >= 23 || hour < 6 {
            text = "Good night!"
        }
        
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 28)
        statusLabel.font = UIFont.systemFont(ofSize: 15)
        statusLabel.textColor = .darkGray
        
        statusLabel.text = "Here's update today."
        greetingLabel.text = text
    }
    
    private func setConstraints() {
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetingLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            greetingLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            greetingLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            statusLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 5)
        ])
    }
}
