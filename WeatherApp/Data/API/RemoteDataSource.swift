//
//  RemoteDataSource.swift
//  WeatherApp
//
//  Created by Hesham Donia on 26/03/2023.
//

import Foundation
import Alamofire

// MARK: - Remote Data Source
class RemoteDataSource {
    
    func sendRequest<T: Codable>(_ request: URLRequest, param: [String : Any], completion: @escaping(Result<T>) -> Void) where T: Decodable {
        
        AF.request(request.url!.absoluteString, method: request.method!, parameters: param , headers: request.headers).responseDecodable(of: T.self) { [weak self] (response) in
            
            //MARK: - Print request and response details
            self?.debuggingResponse(data: response.data, response: response.response)
            
            switch response.result {
            case .success(let data):
                completion(.success(data: data))
                
            case .failure(_):
                guard let data =  response.data else {
                    let appError = AppError(reason: GetFailureReason(rawValue: response.response?.statusCode ?? GetFailureReason.reguestTimedout.rawValue) ?? GetFailureReason.reguestTimedout, message: "unknown error")
                    completion(.failure(appError, code: response.response?.statusCode ?? 0))
                    return
                }
                let emptyResponse = try? JSONDecoder().decode(Empty.self, from: data)
                let reason = GetFailureReason(rawValue: response.response?.statusCode ?? 0)
                let appError = AppError(reason: reason, message: "unknown error")
                completion(.failure(appError, code: 0))
            }
        }
    }
    
    private func debuggingResponse(data: Data?, response: HTTPURLResponse?) {
        if let response = response {
            print(response.debugDescription)
        }
        data?.printFormatedJSON()
    }
    
}

private extension Data {
    
    func printFormatedJSON() {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            pringJSONData(jsonData)
        } else {
            assertionFailure("Malformed JSON")
        }
    }
    
    func printJSON() {
        pringJSONData(self)
    }
    
    private func pringJSONData(_ data: Data) {
        print(String(decoding: data, as: UTF8.self))
    }
}
