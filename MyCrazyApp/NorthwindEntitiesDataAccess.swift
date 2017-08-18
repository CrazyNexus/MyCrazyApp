//
// NorthwindEntitiesDataAccess.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import SAPCommon
import SAPFoundation
import SAPOData

class NorthwindEntitiesDataAccess {
    var service: NorthwindEntities<OnlineODataProvider>
    private let logger: Logger = Logger.shared(named: "ServiceDataAccessLogger")

    init(urlSession: SAPURLSession) {
        let odataProvider = OnlineODataProvider(serviceName: "myServiceName", serviceRoot: Constants.appUrl, sapURLSession: urlSession)
        odataProvider.serviceOptions.checkVersion = false // this disables version validation of the backend OData service and should only be used in demo and test applications
        self.service = NorthwindEntities(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        _ = self.service.provider.networkOptions.tunneledMethods.append("MERGE")
    }

    // -------DataRequesterForEntity: Orders -------
    func loadOrders(completionHandler: @escaping([Order]?, Error?) -> Void) {
        self.executeRequest(self.service.orders, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: SalesByCategories -------
    func loadSalesByCategories(completionHandler: @escaping([SalesByCategory]?, Error?) -> Void) {
        self.executeRequest(self.service.salesByCategories, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Invoices -------
    func loadInvoices(completionHandler: @escaping([Invoice]?, Error?) -> Void) {
        self.executeRequest(self.service.invoices, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: OrdersQries -------
    func loadOrdersQries(completionHandler: @escaping([OrdersQry]?, Error?) -> Void) {
        self.executeRequest(self.service.ordersQries, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Employees -------
    func loadEmployees(completionHandler: @escaping([Employee]?, Error?) -> Void) {
        self.executeRequest(self.service.employees, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: AlphabeticalListOfProducts -------
    func loadAlphabeticalListOfProducts(completionHandler: @escaping([AlphabeticalListOfProduct]?, Error?) -> Void) {
        self.executeRequest(self.service.alphabeticalListOfProducts, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: SummaryOfSalesByQuarters -------
    func loadSummaryOfSalesByQuarters(completionHandler: @escaping([SummaryOfSalesByQuarter]?, Error?) -> Void) {
        self.executeRequest(self.service.summaryOfSalesByQuarters, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Regions -------
    func loadRegions(completionHandler: @escaping([Region]?, Error?) -> Void) {
        self.executeRequest(self.service.regions, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: ProductsAboveAveragePrices -------
    func loadProductsAboveAveragePrices(completionHandler: @escaping([ProductsAboveAveragePrice]?, Error?) -> Void) {
        self.executeRequest(self.service.productsAboveAveragePrices, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Suppliers -------
    func loadSuppliers(completionHandler: @escaping([Supplier]?, Error?) -> Void) {
        self.executeRequest(self.service.suppliers, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: CategorySalesFor1997 -------
    func loadCategorySalesFor1997(completionHandler: @escaping([CategorySalesFor1997]?, Error?) -> Void) {
        self.executeRequest(self.service.categorySalesFor1997, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: SalesTotalsByAmounts -------
    func loadSalesTotalsByAmounts(completionHandler: @escaping([SalesTotalsByAmount]?, Error?) -> Void) {
        self.executeRequest(self.service.salesTotalsByAmounts, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: CustomerDemographics -------
    func loadCustomerDemographics(completionHandler: @escaping([CustomerDemographic]?, Error?) -> Void) {
        self.executeRequest(self.service.customerDemographics, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: OrderDetailsExtendeds -------
    func loadOrderDetailsExtendeds(completionHandler: @escaping([OrderDetailsExtended]?, Error?) -> Void) {
        self.executeRequest(self.service.orderDetailsExtendeds, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Territories -------
    func loadTerritories(completionHandler: @escaping([Territory]?, Error?) -> Void) {
        self.executeRequest(self.service.territories, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: SummaryOfSalesByYears -------
    func loadSummaryOfSalesByYears(completionHandler: @escaping([SummaryOfSalesByYear]?, Error?) -> Void) {
        self.executeRequest(self.service.summaryOfSalesByYears, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: ProductsByCategories -------
    func loadProductsByCategories(completionHandler: @escaping([ProductsByCategory]?, Error?) -> Void) {
        self.executeRequest(self.service.productsByCategories, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: CustomerAndSuppliersByCities -------
    func loadCustomerAndSuppliersByCities(completionHandler: @escaping([CustomerAndSuppliersByCity]?, Error?) -> Void) {
        self.executeRequest(self.service.customerAndSuppliersByCities, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: CurrentProductLists -------
    func loadCurrentProductLists(completionHandler: @escaping([CurrentProductList]?, Error?) -> Void) {
        self.executeRequest(self.service.currentProductLists, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Categories -------
    func loadCategories(completionHandler: @escaping([Category]?, Error?) -> Void) {
        self.executeRequest(self.service.categories, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: ProductSalesFor1997 -------
    func loadProductSalesFor1997(completionHandler: @escaping([ProductSalesFor1997]?, Error?) -> Void) {
        self.executeRequest(self.service.productSalesFor1997, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: OrderDetails -------
    func loadOrderDetails(completionHandler: @escaping([OrderDetail]?, Error?) -> Void) {
        self.executeRequest(self.service.orderDetails, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Customers -------
    func loadCustomers(completionHandler: @escaping([Customer]?, Error?) -> Void) {
        self.executeRequest(self.service.customers, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: OrderSubtotals -------
    func loadOrderSubtotals(completionHandler: @escaping([OrderSubtotal]?, Error?) -> Void) {
        self.executeRequest(self.service.orderSubtotals, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Products -------
    func loadProducts(completionHandler: @escaping([Product]?, Error?) -> Void) {
        self.executeRequest(self.service.products, completionHandler: completionHandler)
    }

    // -------DataRequesterForEntity: Shippers -------
    func loadShippers(completionHandler: @escaping([Shipper]?, Error?) -> Void) {
        self.executeRequest(self.service.shippers, completionHandler: completionHandler)
    }

    private func executeRequest<T>(_ request: @escaping(DataQuery) throws -> [T], completionHandler: @escaping([T]?, Error?) -> Void) {
        DispatchQueue.global().async {
            let query = DataQuery().selectAll().top(20)
            do {
                let result = try request(query)
                completionHandler(result, nil)
            } catch let error {

                self.logger.info("Error happened in the downloading process. Error: \(error)")
                completionHandler(nil, error)
            }
        }
    }
}
