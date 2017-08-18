//
// Constants.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//

import Foundation
import SAPFoundation

enum CollectionType: String {
    case orders = "Orders"
    case salesByCategories = "SalesByCategories"
    case invoices = "Invoices"
    case ordersQries = "OrdersQries"
    case employees = "Employees"
    case alphabeticalListOfProducts = "AlphabeticalListOfProducts"
    case summaryOfSalesByQuarters = "SummaryOfSalesByQuarters"
    case regions = "Regions"
    case productsAboveAveragePrices = "ProductsAboveAveragePrices"
    case suppliers = "Suppliers"
    case categorySalesFor1997 = "CategorySalesFor1997"
    case salesTotalsByAmounts = "SalesTotalsByAmounts"
    case customerDemographics = "CustomerDemographics"
    case orderDetailsExtendeds = "OrderDetailsExtendeds"
    case territories = "Territories"
    case summaryOfSalesByYears = "SummaryOfSalesByYears"
    case productsByCategories = "ProductsByCategories"
    case customerAndSuppliersByCities = "CustomerAndSuppliersByCities"
    case currentProductLists = "CurrentProductLists"
    case categories = "Categories"
    case productSalesFor1997 = "ProductSalesFor1997"
    case orderDetails = "OrderDetails"
    case customers = "Customers"
    case orderSubtotals = "OrderSubtotals"
    case products = "Products"
    case shippers = "Shippers"
    case none = ""

    static let allValues: [CollectionType] = [
        orders, salesByCategories, invoices, ordersQries, employees, alphabeticalListOfProducts, summaryOfSalesByQuarters, regions, productsAboveAveragePrices, suppliers, categorySalesFor1997, salesTotalsByAmounts, customerDemographics, orderDetailsExtendeds, territories, summaryOfSalesByYears, productsByCategories, customerAndSuppliersByCities, currentProductLists, categories, productSalesFor1997, orderDetails, customers, orderSubtotals, products, shippers]
}

struct Constants {

    static let appId = "com.sap.MyCrazyApp"
    private static let sapcpmsUrlString = "https://mobile-d041630sapdev.int.sap.hana.ondemand.com/"
    static let sapcpmsUrl = URL(string: sapcpmsUrlString)!
    static let appUrl = Constants.sapcpmsUrl.appendingPathComponent(appId)
    static let configurationParameters = SAPcpmsSettingsParameters(backendURL: Constants.sapcpmsUrl, applicationID: Constants.appId)
}
