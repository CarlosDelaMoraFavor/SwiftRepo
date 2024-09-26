//
//  Created by Timothy Moose on 12/14/23.
//

import Foundation
import SwiftUI

public struct DefaultError: AppError {

    // MARK: - API

    public init(
        error: Error?,
        uiError: UIError?,
        isRetryable: Bool,
        isNotable: Bool,
        intent: ErrorIntent = .indispensable
    ) {
        self.uiError = uiError
        self.error = error
        self.isNotable = isNotable
        self.isRetryable = isRetryable
        self.intent = intent
    }

    // MARK: - Constants

    // MARK: - Variables

    public var uiError: UIError?

    public let isNotable: Bool

    public let isRetryable: Bool
    
    public var intent: ErrorIntent

    public let error: Error?

    public var localizedDescription: String {
        if let error {
            return error.localizedDescription
        }
        return uiError?.message ?? "Unexpected error with no description provided."
    }
}
