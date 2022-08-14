//
//  TaskTypeCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskTypeCell: UITableViewCell {
    let typeSegment = CustomSegmentControl() // MainModule/Views/
    private let tabs = [ TypeTab.basic.rawValue,
                         TypeTab.urgent.rawValue,
                         TypeTab.important.rawValue ]
    
    private let sideIndent: Double = 20
    
    func configure(height: Double, width: Double, currentTab: Int? = nil) {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        typeSegment.configurate(tabTitles: tabs, currentTab: currentTab, height: height, width: width)
        
        self.addSubview(typeSegment)
        setConstraints()
    }
    
    private func setConstraints() {
        typeSegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeSegment.topAnchor.constraint(equalTo: self.topAnchor, constant: sideIndent),
            typeSegment.leftAnchor.constraint(equalTo: self.leftAnchor, constant: sideIndent),
            typeSegment.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -sideIndent),
            typeSegment.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
