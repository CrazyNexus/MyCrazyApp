//
// DetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//

import SAPOData
import SAPFiori

protocol DetailTableDelegate: UITableViewDelegate, UITableViewDataSource {
    var entity: EntityValue { get set }
}

extension DetailTableDelegate {

    func cellForProperty(tableView: UITableView, indexPath: IndexPath, property: Property, value: String, changeHandler: @escaping((String) -> Bool)) -> UITableViewCell {
        let cell: UITableViewCell!

        if (property.dataType.isBasic) {
            // The property is a key or we are creating new entity
            if (!property.isKey || self.entity.isNew) {
                // .. that CAN be edited
                cell = self.cellWithEditableContent(tableView: tableView, indexPath: indexPath, property: property, with: value, changeHandler: changeHandler)
            } else {
                // .. that CANNOT be edited
                cell = self.cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, for: property.name, with: value)
            }
        } else {
            // A complex property
            cell = self.cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, for: property.name, with: "...")
        }
        return cell
    }

    func cellForDefault(tableView: UITableView, indexPath: IndexPath) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell
        cell.textLabel!.text = ""
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.keyName = "default"

        return cell
    }

    private func cellWithEditableContent(tableView: UITableView, indexPath: IndexPath, property: Property, with value: String, changeHandler: @escaping((String) -> Bool)) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell

        cell.isEditable = true
        cell.keyName = property.name
        cell.value = value

        if !property.isOptional {
            cell.valueTextField!.placeholder = NSLocalizedString("keyRequiredPlaceholder", value: "Required", comment: "XSEL: Placeholder text for required but currently empty textfield.")
        }

        cell.onChangeHandler = { (newValue) -> Void in
            if !changeHandler(newValue) {
                cell.valueTextField.textColor = UIColor.red
            } else {
                cell.valueTextField.textColor = UIColor.gray
            }
        }

        return cell
    }

    private func cellWithNonEditableContent(tableView: UITableView, indexPath: IndexPath, for key: String, with value: String) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell

        cell.keyName = key
        cell.value = value

        return cell
    }

    private func selectKeyboardFor(_ type: DataType) -> UIKeyboardType {
        switch type.code {
        case DataType.byte, DataType.short, DataType.integer, DataType.int:
            return .decimalPad
        case DataType.decimal, DataType.double, DataType.localDateTime, DataType.globalDateTime:
            return .numbersAndPunctuation
        default:
            return .`default`
        }
    }

    func defaultValueFor(_ property: Property) -> Double {
        if let defaultValue = property.defaultValue {
            return Double(defaultValue.toString())!
        } else {
            return Double()
        }
    }

    func defaultValueFor(_ property: Property) -> BigDecimal {
        if let defaultValue = property.defaultValue {
            return (defaultValue as! DecimalValue).value
        } else {
            return BigDecimal.fromDouble(Double())
        }
    }

    func defaultValueFor(_ property: Property) -> Int {
        if let defaultValue = property.defaultValue {
            return Int(defaultValue.toString())!
        } else {
            return Int()
        }
    }

    func defaultValueFor(_ property: Property) -> BigInteger {
        if let defaultValue = property.defaultValue {
            return BigInteger(defaultValue.toString())
        } else {
            return BigInteger.fromInt(Int())
        }
    }

    func defaultValueFor(_ property: Property) -> Int64 {
        if let defaultValue = property.defaultValue {
            return Int64(defaultValue.toString())!
        } else {
            return Int64()
        }
    }

    func defaultValueFor(_ property: Property) -> Float {
        if let defaultValue = property.defaultValue {
            return Float(defaultValue.toString())!
        } else {
            return Float()
        }
    }

    func defaultValueFor(_ property: Property) -> LocalDateTime {
        if let defaultValue = property.defaultValue {
            return LocalDateTime.parse(defaultValue.toString())!
        } else {
            return LocalDateTime.now()
        }
    }

    func defaultValueFor(_ property: Property) -> GlobalDateTime {
        if let defaultValue = property.defaultValue {
            return GlobalDateTime.parse(defaultValue.toString())!
        } else {
            return GlobalDateTime.now()
        }
    }

    func defaultValueFor(_ property: Property) -> GuidValue {
        if let defaultValue = property.defaultValue {
            return GuidValue.parse(defaultValue.toString())!
        } else {
            return GuidValue.random()
        }
    }

    func defaultValueFor(_ property: Property) -> String {
        if let defaultValue = property.defaultValue {
            return defaultValue.toString()
        } else {
            return ""
        }
    }

    func defaultValueFor(_ property: Property) -> Bool {
        if let defaultValue = property.defaultValue {
            return defaultValue.toString().toBool()!
        } else {
            return Bool()
        }
    }
}

extension DetailViewController {

    func generatedTableDelegate() -> DetailTableDelegate? {
        switch self.collectionType {
        case .orders:
            return OrderDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .salesByCategories:
            return SalesByCategoryDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .invoices:
            return InvoiceDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .ordersQries:
            return OrdersQryDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .employees:
            return EmployeeDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .alphabeticalListOfProducts:
            return AlphabeticalListOfProductDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .summaryOfSalesByQuarters:
            return SummaryOfSalesByQuarterDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .regions:
            return RegionDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .productsAboveAveragePrices:
            return ProductsAboveAveragePriceDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .suppliers:
            return SupplierDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .categorySalesFor1997:
            return CategorySalesFor1997DetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .salesTotalsByAmounts:
            return SalesTotalsByAmountDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .customerDemographics:
            return CustomerDemographicDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .orderDetailsExtendeds:
            return OrderDetailsExtendedDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .territories:
            return TerritoryDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .summaryOfSalesByYears:
            return SummaryOfSalesByYearDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .productsByCategories:
            return ProductsByCategoryDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .customerAndSuppliersByCities:
            return CustomerAndSuppliersByCityDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .currentProductLists:
            return CurrentProductListDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .categories:
            return CategoryDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .productSalesFor1997:
            return ProductSalesFor1997DetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .orderDetails:
            return OrderDetailDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .customers:
            return CustomerDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .orderSubtotals:
            return OrderSubtotalDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .products:
            return ProductDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        case .shippers:
            return ShipperDetailTableDelegate(dataAccess: self.northwindEntities, rightBarButton: self.navigationItem.rightBarButtonItem!)
        default:
            return nil
        }
    }
}
