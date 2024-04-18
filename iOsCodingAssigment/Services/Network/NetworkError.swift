//
//  NetworkError.swift
//  iOsCodingAssigment
//
//  Created by Gregori farias  on 15/4/24.
//

import Foundation

enum NetworkError: Error {
    case malformedURL
    case dataFormatting
    case other
    case noData
    case errorCode(Int?)
    case decoding
}
