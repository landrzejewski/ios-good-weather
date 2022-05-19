//
//  GoodWeatherTests.swift
//  GoodWeatherTests
//
//  Created by Łukasz Andrzejewski on 16/05/2022.
//

import XCTest
@testable import GoodWeather

class GoodWeatherTests: XCTestCase {
    
    private var calculator: Calculator!
    
    override func setUp() {
        calculator = Calculator()
    }

    func test_given_two_numbers_when_add_then_returns_their_sum() throws {
        // Given/Arrange
        let firstNumber = 1.0
        let secondNumber = 2.0
        // When/Act
        let result = calculator.add(firstNumber: firstNumber, secondNumber: secondNumber)
        // Then/Assert
        XCTAssertEqual(3.0, result)
    }
    
    func test_given_divisor_equals_zero_when_divide_then_throws_exception() {
        XCTAssertThrowsError(try calculator.divide(firstNumber: 3.0, secondNumber: 0))
    }
    
    func test_when_get_random_prime_then_returns_prime_number() throws {
        /*let expectation = expectation(description: "Prime number is returned")
        var result: Int?
        calculator.getRandomPrime {
            result = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)*/
        let result = try asyncCall(calculator.getRandomPrime)
        XCTAssertEqual(3, result)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

extension XCTestCase {
    
    func asyncCall<Result> (_ callback: (@escaping (Result) -> ()) -> ()) throws -> Result {
        let expectation = expectation(description: "Async task")
        var result: Result?
        callback() {
            result = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
        guard let unwrappedResult = result else {
            fatalError()
        }
        return unwrappedResult
    }
    
}
