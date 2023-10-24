//
//  APIManager.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import Foundation

protocol JSONParsable {
    func numberOfSection() -> Int
    func numberOfItemsInSection(index: SectionList) -> Int
    func getItem(indexPath: IndexPath) -> Destination
    func parseJSON() -> [Destination]?
    func loadLocalJSON<T>(_ filename: String) throws -> T where T: Decodable
}

final class APIManager: JSONParsable {
    
    var result = [Destination]()
    
    func numberOfSection() -> Int {
        return SectionList.allCases.count
    }
    
    func numberOfItemsInSection(index: SectionList) -> Int {
        switch index {
        case .poster: return 1
        case .nearByTravel:
            guard let swapResult = self.parseJSON() else {
                return 0
            }
            result = swapResult
            return self.result.count
        case .recommendation:
            return 3
        }
    }
    
    func getItem(indexPath: IndexPath) -> Destination {
        return result[indexPath.row]
    }
    
    internal func parseJSON() -> [Destination]? {
        guard let result: [Destination] = try? loadLocalJSON("mock.json") else { return nil }
        return result
    }
    
    internal func loadLocalJSON<T>(_ filename: String) throws -> T where T: Decodable {
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: filename, withExtension: nil) else {
            print(JSONErrors.notFoundJSONFile.failureReason!)
            throw JSONErrors.notFoundJSONFile
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            print(JSONErrors.notLoadData.failureReason!)
            throw JSONErrors.notLoadData
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print(JSONErrors.unableToDecode.failureReason!)
            throw JSONErrors.unableToDecode
        }
    }
}

enum JSONErrors: LocalizedError {
    case notFoundJSONFile
    case notLoadData
    case unableToDecode
    case unableToParse

    var errorDescription: String? {
        switch self {
        case .notFoundJSONFile:
            return NSLocalizedString("JSON 파일을 찾을 수 없습니다.", comment: "File Not Found")
        case .notLoadData:
            return NSLocalizedString("데이터를 불러올 수 없습니다.", comment: "Data Not Loaded")
        case .unableToDecode:
            return NSLocalizedString("디코딩에 실패했습니다.", comment: "Decode Failure")
        case .unableToParse:
            return NSLocalizedString("파싱에 실패했습니다.", comment: "Parse Failure")
        }
    }

    var failureReason: String? {
        switch self {
        case .notFoundJSONFile:
            return NSLocalizedString("지정된 경로에 JSON 파일이 없습니다.", comment: "")
        case .notLoadData:
            return NSLocalizedString("파일에서 데이터를 불러오지 못했습니다.", comment: "")
        case .unableToDecode:
            return NSLocalizedString("디코딩 과정에서 문제가 발생했습니다.", comment: "")
        case .unableToParse:
            return NSLocalizedString("JSON 구조를 파싱하는 도중 문제가 발생했습니다.", comment: "")
        }
    }
}
