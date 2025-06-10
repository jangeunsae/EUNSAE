import Foundation

class BaseballGame {
    let recordManager = RecordManager()
    
    func start() {
        print("환영합니다. 원하시는 번호를 입력해주세요!")
        
        while true {
            showMenu()
            let input = readLine()
            menuSelection(input)
        }
    }

    func showMenu() {
        print("\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        print("메뉴 선택: ", terminator: "")
    }

    func menuSelection(_ input: String?) {
        switch input {
        case "1":
            playGame()
        case "2":
            showRecord()
        case "3":
            exitGame()
        default:
            print("올바른 숫자를 입력해주세요!")
        }
    }

    func playGame() {
        let answer = makeAnswer()
        var tryCount = 0

        printGameStart()

        while true {
            let input = getUserInput()
            guard validateInput(input) else { continue }

            let userGuess = input.compactMap { Int(String($0)) }
            tryCount += 1

            if handleGuess(answer: answer, userGuess: userGuess, tryCount: tryCount) {
                break
            }
        }
    }

    func printGameStart() {
        print("게임을 시작합니다! 0~9 사이의 중복되지 않은 숫자 3개를 입력하세요. 0은 맨 앞자리에 올 수 없습니다.")
    }

    func handleGuess(answer: [Int], userGuess: [Int], tryCount: Int) -> Bool {
        let (strike, ball) = evaluateGuess(answer, userGuess)

        if strike == 3 {
            print("정답입니다! 시도 횟수: \(tryCount)번")
            recordManager.setRecordArray(tryCount)
            return true
        }

        printGuessResult(strike: strike, ball: ball)
        return false
    }

    func printGuessResult(strike: Int, ball: Int) {
        if strike == 0 && ball == 0 {
            print("Nothing")
        } else {
            print("\(strike) 스트라이크, \(ball) 볼")
        }
    }
    
    func showRecord() {
        print("\n< 기록 불러오기 >")
        recordManager.getRecordArray()
    }

    func exitGame() {
        print("< 숫자 야구 게임을 종료합니다 >")
        exit(0)
    }
    
    func getUserInput() -> String {
        print("세 자리 숫자를 입력하세요 : ", terminator: "")
        return readLine() ?? ""
    }

    func validateInput(_ input: String) -> Bool {
        if input.count != 3 {
            print("입력은 정확히 3자리 숫자여야 합니다.")
            return false
        }

        let numbers = input.compactMap { Int(String($0)) }
        
        if numbers.count != 3 || numbers[0] == 0 || Set(numbers).count != 3 {
            print("올바른 숫자 형식이 아닙니다. (중복 없이, 숫자만, 첫 자리는 0이 아니어야 합니다.)")
            return false
        }
        return true
    }

    func evaluateGuess(_ answer: [Int], _ userGuess: [Int]) -> (Int, Int) {
        var strike = 0
        var ball = 0

        for (index, number) in userGuess.enumerated() {
            if number == answer[index] {
                strike += 1
            } else if answer.contains(number) {
                ball += 1
            }
        }

        return (strike, ball)
    }

    func makeAnswer() -> [Int] {
        let array = (0...9)
        var shuffledArray = array.shuffled()
        while shuffledArray[0] == 0 {
            shuffledArray = array.shuffled()
        }
        return Array(shuffledArray[0...2])
    }
}
