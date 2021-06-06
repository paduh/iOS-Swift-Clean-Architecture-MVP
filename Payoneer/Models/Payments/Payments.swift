//
//  Payments.swift
//  Payoneer
//
//  Created by Aduh Perfect on 05/06/2021.
//

import Foundation


// MARK:- Payments

public struct Payments: Codable {
    public let links: PaymentsLinks?
    public let timestamp: String?
    public let operation: String?
    public let resultCode: String?
    public let resultInfo: String?
    public let returnCode: ReturnCode?
    public let status: Interaction?
    public let interaction: Interaction?
    public let identification: Identification?
    public let networks: Networks?
    public let operationType: OperationType?
    public let style: Style?
    public let payment: Payment?
    public let integrationType: String?

    public init(
        links: PaymentsLinks?,
        timestamp: String?,
        operation: String?,
        resultCode: String?,
        resultInfo: String?,
        returnCode: ReturnCode?,
        status: Interaction?,
        interaction: Interaction?,
        identification: Identification?,
        networks: Networks?,
        operationType: OperationType?,
        style: Style?,
        payment: Payment?,
        integrationType: String?
    ) {
        self.links = links
        self.timestamp = timestamp
        self.operation = operation
        self.resultCode = resultCode
        self.resultInfo = resultInfo
        self.returnCode = returnCode
        self.status = status
        self.interaction = interaction
        self.identification = identification
        self.networks = networks
        self.operationType = operationType
        self.style = style
        self.payment = payment
        self.integrationType = integrationType
    }
}

// MARK: - Identification
public struct Identification: Codable {
    public let longId: String?
    public let shortId: String?
    public let transactionId: String?

    public init(
        longId: String?,
        shortId: String?,
        transactionId: String?
    ) {
        self.longId = longId
        self.shortId = shortId
        self.transactionId = transactionId
    }
}

// MARK: - Interaction
public struct Interaction: Codable {
    public let code: String?
    public let reason: String?

    public init(
        code: String?,
        reason: String?
    ) {
        self.code = code
        self.reason = reason
    }
}

// MARK: - PaloaltoNatLinks
public struct PaymentsLinks: Codable {
    public let linksSelf: String?
    public let lang: String?

    public init(
        linksSelf: String?,
        lang: String?
    ) {
        self.linksSelf = linksSelf
        self.lang = lang
    }
}

// MARK: - Networks
public struct Networks: Codable {
    public let applicable: [Applicable]?

    public init(applicable: [Applicable]?) {
        self.applicable = applicable
    }
}

// MARK: - Applicable
public struct Applicable: Codable {
    public let code: String?
    public let label: String?
    public let method: String?
    public let grouping: String?
    public let registration: Recurrence?
    public let recurrence: Recurrence?
    public let redirect: Bool?
    public let links: ApplicableLinks?
    public let selected: Bool?
    public let inputElements: [InputElement]?
    public let operationType: OperationType?
    public let contractData: ContractData?

    public init(
        code: String?,
        label: String?,
        method: String?,
        grouping: String?,
        registration: Recurrence?,
        recurrence: Recurrence?,
        redirect: Bool?,
        links: ApplicableLinks?,
        selected: Bool?,
        inputElements: [InputElement]?,
        operationType: OperationType?,
        contractData: ContractData?
    ) {
        self.code = code
        self.label = label
        self.method = method
        self.grouping = grouping
        self.registration = registration
        self.recurrence = recurrence
        self.redirect = redirect
        self.links = links
        self.selected = selected
        self.inputElements = inputElements
        self.operationType = operationType
        self.contractData = contractData
    }
}

// MARK: - ContractData
public struct ContractData: Codable {
    public let pageEnvironment: String?
    public let javascriptIntegration: String?
    public let pageButtonLocale: String?

    enum CodingKeys: String, CodingKey {
        case pageEnvironment = "PAGE_ENVIRONMENT"
        case javascriptIntegration = "JAVASCRIPT_INTEGRATION"
        case pageButtonLocale = "PAGE_BUTTON_LOCALE"
    }

    public init(
        pageEnvironment: String?,
        javascriptIntegration: String?,
        pageButtonLocale: String?
    ) {
        self.pageEnvironment = pageEnvironment
        self.javascriptIntegration = javascriptIntegration
        self.pageButtonLocale = pageButtonLocale
    }
}

// MARK: - InputElement
public struct InputElement: Codable {
    public let name: Name?
    public let type: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }

    public init(name: Name?, type: TypeEnum?) {
        self.name = name
        self.type = type
    }
}

public enum Name: String, Codable {
    case bic = "bic"
    case expiryMonth = "expiryMonth"
    case expiryYear = "expiryYear"
    case holderName = "holderName"
    case iban = "iban"
    case number = "number"
    case verificationCode = "verificationCode"
}

public enum TypeEnum: String, Codable {
    case integer = "integer"
    case numeric = "numeric"
    case string = "string"
}

// MARK: - ApplicableLinks
public struct ApplicableLinks: Codable {
    public let logo: String?
    public let linksSelf: String?
    public let lang: String?
    public let operation: String?
    public let validation: String?

    public init(
        logo: String?,
        linksSelf: String?,
        lang: String?,
        operation: String?,
        validation: String?
    ) {
        self.logo = logo
        self.linksSelf = linksSelf
        self.lang = lang
        self.operation = operation
        self.validation = validation
    }
}

public enum OperationType: String, Codable {
    case charge = "CHARGE"
}

public enum Recurrence: String, Codable {
    case none = "NONE"
    case recurrenceOptional = "OPTIONAL"
}

// MARK: - Payment
public struct Payment: Codable {
    public let reference: String?
    public let amount: Int?
    public let currency: String?

    public init(
        reference: String?,
        amount: Int?,
        currency: String?
    ) {
        self.reference = reference
        self.amount = amount
        self.currency = currency
    }
}

// MARK: - ReturnCode
public struct ReturnCode: Codable {
    public let name: String?
    public let source: String?

    public init(
        name: String?,
        source: String?
    ) {
        self.name = name
        self.source = source
    }
}

// MARK: - Style
public struct Style: Codable {
    public let language: String?

    public init(language: String?) {
        self.language = language
    }
}
