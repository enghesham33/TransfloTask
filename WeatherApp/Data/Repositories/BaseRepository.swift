//
//  BaseRepository.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation

class BaseRepository {
    let config: ApiDataNetworkConfig
    let remoteDataSource : RemoteDataSource
    
    init(config: ApiDataNetworkConfig, remoteDataSource: RemoteDataSource) {
        self.config = config
        self.remoteDataSource = remoteDataSource
    }
}
