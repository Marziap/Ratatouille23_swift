//
//  Ratatuille23Tests.swift
//  Ratatuille23Tests
//
//  Created by Marzia Pirozzi on 23/09/23.
//

import XCTest
@testable import Ratatuille23

final class Ratatuille23Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTelefonoValidoEmptyFalse() throws {
        // Arrange
        let telefono = "1234567890"
        let empty = false
        
        // Act
        let risultato = try functions.checkTelefono(telefono: telefono, empty: empty)
        
        // Assert
        XCTAssertEqual(risultato, true)
    }
    
    func testTelefonoValidoEmptyTrue() throws {
        // Arrange
        let telefono = "1234567890"
        let empty = true
    
        
        // Assert
        XCTAssertThrowsError(try functions.checkTelefono(telefono: telefono, empty: empty)) { error in
            XCTAssertEqual(error as! serverAPI.MyError, serverAPI.MyError.emptyField)
        }
    }
    
    
    func testTelefonoNumericoLunghezzaNon10EmptyFalse() throws {
        // Arrange
        let telefono = "1234567"
        let empty = false
        
        // Act
        let risultato = try functions.checkTelefono(telefono: telefono, empty: empty)
        
        // Assert
        XCTAssertEqual(risultato, false)
    }
    
    func testTelefonoNumericoLunghezzaNon10EmptyTrue() throws {
        // Arrange
        let telefono = "123456"
        let empty = true
        
        
        // Assert
        XCTAssertThrowsError(try functions.checkTelefono(telefono: telefono, empty: empty)) { error in
            XCTAssertEqual(error as! serverAPI.MyError, serverAPI.MyError.emptyField)
        }
    }
    
    func testTelefonoAlfanumericoEmptyFalse() throws {
        // Arrange
        let telefono = ""
        let empty = false
        
        // Act
        let risultato = try functions.checkTelefono(telefono: telefono, empty: empty)
        
        // Assert
        XCTAssertEqual(risultato, false)
    }
    
    func testTelefonoAlfanumericoEmptyTrue() throws {
        // Arrange
        let telefono = "jvdedw,12456"
        let empty = true
        
        // Act
//        let risultato = try functions.checkTelefono(telefono: telefono, empty: empty)
        
        // Assert
        XCTAssertThrowsError(try functions.checkTelefono(telefono: telefono, empty: empty)) { error in
            XCTAssertEqual(error as! serverAPI.MyError, serverAPI.MyError.emptyField)
        }
    }
    
}
