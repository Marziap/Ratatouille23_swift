//
//  CheckUsernamePassword.swift
//  Ratatuille23Tests
//
//  Created by Marzia Pirozzi on 20/11/23.
//

import XCTest
@testable import Ratatuille23

final class CheckUsernamePassword: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUsernamePasswordMatch() async throws {
        let username = "waiter1"
        let password = "password1"
        let employee: [Employee] = [Employee(id: 3, username: username, password: password, firstaccess: false, ruolo: "cameriere", id_ristorante: 1)]
        
        // Act
        let risultato = try await serverAPI.getUserPass( username: username, password: password)
        
        // Assert
        XCTAssertEqual(risultato, employee)
    }
    
    
    
    func testUsernamePasswordBothExistingNoMatch() async throws {
        let username = "waiter1"
        let password = "password3"
        let employee: [Employee] = []
        
        // Act
        let risultato = try await serverAPI.getUserPass( username: username, password: password)
        
        // Assert
        XCTAssertEqual(risultato, employee)
    }

    
    func testUsernameExistsPasswordNotExists() async throws {
        let username = "waiter1"
        let password = "asdfghjk"
        let employee: [Employee] = []
        
        // Act
        let risultato = try await serverAPI.getUserPass( username: username, password: password)
        
        // Assert
        XCTAssertEqual(risultato, employee)
    }
    
    func testUsernameNotExistsPasswordExists() async throws {
        let username = "sdfghjkl"
        let password = "password1"
        let employee: [Employee] = []
        
        // Act
        let risultato = try await serverAPI.getUserPass( username: username, password: password)
        
        // Assert
        XCTAssertEqual(risultato, employee)
    }


}
