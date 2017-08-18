//
// EmployeeDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class EmployeeDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: Employee?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? Employee
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 18)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? Employee else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.employeeID) {
                value = "\(currentEntity.employeeID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.employeeID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.employeeID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.lastName) {
                value = "\(currentEntity.lastName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.lastName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Employee.lastName) {
                    currentEntity.lastName = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.firstName) {
                value = "\(currentEntity.firstName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.firstName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Employee.firstName) {
                    currentEntity.firstName = validValue
                    self.validity[2] = true
                } else {
                    self.validity[2] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        case 3:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.title) {
                if let title = currentEntity.title {
                    value = "\(title)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.title, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.title = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.title) {
                        currentEntity.title = validValue
                        self.validity[3] = true
                    } else {
                        self.validity[3] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[3]
            })
        case 4:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.titleOfCourtesy) {
                if let titleOfCourtesy = currentEntity.titleOfCourtesy {
                    value = "\(titleOfCourtesy)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.titleOfCourtesy, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.titleOfCourtesy = nil
                    self.validity[4] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.titleOfCourtesy) {
                        currentEntity.titleOfCourtesy = validValue
                        self.validity[4] = true
                    } else {
                        self.validity[4] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[4]
            })
        case 5:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.birthDate) {
                if let birthDate = currentEntity.birthDate {
                    value = "\(birthDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.birthDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.birthDate = nil
                    self.validity[5] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.birthDate = validValue
                        self.validity[5] = true
                    } else {
                        self.validity[5] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[5]
            })
        case 6:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.hireDate) {
                if let hireDate = currentEntity.hireDate {
                    value = "\(hireDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.hireDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.hireDate = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.hireDate = validValue
                        self.validity[6] = true
                    } else {
                        self.validity[6] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[6]
            })
        case 7:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.address) {
                if let address = currentEntity.address {
                    value = "\(address)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.address, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.address = nil
                    self.validity[7] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.address) {
                        currentEntity.address = validValue
                        self.validity[7] = true
                    } else {
                        self.validity[7] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[7]
            })
        case 8:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.city) {
                if let city = currentEntity.city {
                    value = "\(city)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.city, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.city = nil
                    self.validity[8] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.city) {
                        currentEntity.city = validValue
                        self.validity[8] = true
                    } else {
                        self.validity[8] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[8]
            })
        case 9:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.region) {
                if let region = currentEntity.region {
                    value = "\(region)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.region, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.region = nil
                    self.validity[9] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.region) {
                        currentEntity.region = validValue
                        self.validity[9] = true
                    } else {
                        self.validity[9] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[9]
            })
        case 10:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.postalCode) {
                if let postalCode = currentEntity.postalCode {
                    value = "\(postalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.postalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.postalCode = nil
                    self.validity[10] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.postalCode) {
                        currentEntity.postalCode = validValue
                        self.validity[10] = true
                    } else {
                        self.validity[10] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[10]
            })
        case 11:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.country) {
                if let country = currentEntity.country {
                    value = "\(country)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.country, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.country = nil
                    self.validity[11] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.country) {
                        currentEntity.country = validValue
                        self.validity[11] = true
                    } else {
                        self.validity[11] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[11]
            })
        case 12:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.homePhone) {
                if let homePhone = currentEntity.homePhone {
                    value = "\(homePhone)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.homePhone, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.homePhone = nil
                    self.validity[12] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.homePhone) {
                        currentEntity.homePhone = validValue
                        self.validity[12] = true
                    } else {
                        self.validity[12] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[12]
            })
        case 13:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.`extension`) {
                if let `extension` = currentEntity.`extension` {
                    value = "\(`extension`)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.`extension`, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.`extension` = nil
                    self.validity[13] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.`extension`) {
                        currentEntity.`extension` = validValue
                        self.validity[13] = true
                    } else {
                        self.validity[13] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[13]
            })
        case 14:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.notes) {
                if let notes = currentEntity.notes {
                    value = "\(notes)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.notes, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.notes = nil
                    self.validity[14] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.notes) {
                        currentEntity.notes = validValue
                        self.validity[14] = true
                    } else {
                        self.validity[14] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[14]
            })
        case 15:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.reportsTo) {
                if let reportsTo = currentEntity.reportsTo {
                    value = "\(reportsTo)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.reportsTo, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.reportsTo = nil
                    self.validity[15] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.reportsTo = validValue
                        self.validity[15] = true
                    } else {
                        self.validity[15] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[15]
            })
        case 16:
            var value = ""
            if currentEntity.hasDataValue(for: Employee.photoPath) {
                if let photoPath = currentEntity.photoPath {
                    value = "\(photoPath)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Employee.photoPath, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.photoPath = nil
                    self.validity[16] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Employee.photoPath) {
                        currentEntity.photoPath = validValue
                        self.validity[16] = true
                    } else {
                        self.validity[16] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[16]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> Employee {
        let newEntity = Employee()
        newEntity.employeeID = defaultValueFor(Employee.employeeID)
        newEntity.lastName = defaultValueFor(Employee.lastName)
        newEntity.firstName = defaultValueFor(Employee.firstName)
        return newEntity
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.first { (field) -> Bool in
            return field == false
        }
        self.rightBarButton.isEnabled = anyFieldInvalid == nil
    }
}
