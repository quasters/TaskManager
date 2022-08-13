//
//  DataFetcher.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 14.08.2022.
//

import Foundation

protocol DataProviderProtocol {
    
}

class DataProvider: DataProviderProtocol {
    private let dataManager = DataStoreManager.shared
}
