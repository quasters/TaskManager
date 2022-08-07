//
//  ScrollSegment.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class DaySegment: UISegmentedControl {
    
    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.selectedSegmentIndex = 1
        // set colors
        
        self.backgroundColor = .white
        self.selectedSegmentTintColor = .black
        self.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        self.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
}
