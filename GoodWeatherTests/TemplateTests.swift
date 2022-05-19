//
//  TemplateTests.swift
//  GoodWeatherTests
//
//  Created by Łukasz Andrzejewski on 19/05/2022.
//

import XCTest
@testable import GoodWeather

class TemplatesTests: XCTestCase {
    
    private let textWithoutExpressions = "My name is Jan Kowalski"
    private let textWithExpressions = "My name is ${firstName} ${lastName}"

    func test_given_a_text_without_expressions_when_evaluate_then_returns_the_text() {
        let template = Template(textWithExpressions: textWithoutExpressions)
        XCTAssertEqual(textWithoutExpressions, try template.evaluate(parameters: [:]))
    }
    
    func test_given_a_text_with_expressions_when_evaluate_then_returns_the_text_with_substituted_parameters() {
        let template = Template(textWithExpressions: textWithExpressions)
        XCTAssertEqual(textWithoutExpressions, try template.evaluate(parameters: ["firstName": "Jan", "lastName": "Kowalski"]))
    }
    
    func test_given_a_text_with_expressions_when_evaluate_without_providing_all_parameters_then_throws_exception() {
        XCTAssertThrowsError(try Template(textWithExpressions: textWithExpressions)
            .evaluate(parameters: [:]))
    }
    
}
