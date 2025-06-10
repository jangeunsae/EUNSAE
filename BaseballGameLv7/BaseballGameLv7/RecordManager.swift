//
//  recordManager.swift
//  BaseballGameLv7
//
//  Created by 장은새 on 6/9/25.
//
class RecordManager {
    //유저들의 게임 기록 배열
    private var recordArray: [Int] = []
    
    func setRecordArray(_ count: Int) {
        recordArray.append(count)
    }
    
    func getRecordArray() {
        if recordArray.isEmpty {
            print("기록이 존재하지 않습니다.")
        } else {
            print("\n< 게임 기록 보기 >")
            for (index, count) in recordArray.enumerated() {
                print("\(index + 1)번째 게임 : 시도 횟수 - \(count)번")
            }
        }
    }
}


