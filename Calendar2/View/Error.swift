//
//  Error.swift
//  Calendar2
//
//  Created by MAC2020 on 4/25/24.
//

import Foundation

enum CalendarError: Error {
    case dateComponentsError
    
    var errorMessage: String {
        switch self {
        case .dateComponentsError:
            return "날짜 구성 요소 오류 입니다."
        }
    }
}
