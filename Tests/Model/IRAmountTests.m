/**
 * Copyright Soramitsu Co., Ltd. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

@import XCTest;
@import IrohaCommunication;

static const NSUInteger VALID_STRING_AMOUNT_COUNT = 4;
static NSString * const VALID_STRING_AMOUNT[] = {
    @"0.001",
    @"10",
    @"123456.789",
    @"0.1234"
};

static const NSUInteger INVALID_STRING_AMOUNT_COUNT = 4;
static NSString * const INVALID_STRING_AMOUNT[] = {
    @"",
    @"-10.21",
    @"1,0789",
    @"89a789"
};

static const NSUInteger INVALID_STRING_TRANSFER_AMOUNT_COUNT = 6;
static NSString * const INVALID_STRING_TRANSFER_AMOUNT[] = {
    @"",
    @"0",
    @"0.0",
    @"-10.21",
    @"1,0789",
    @"89a789"
};

@interface IRAmountTests : XCTestCase

@end

@implementation IRAmountTests

- (void)testValidStringAmount {
    for (NSUInteger i = 0; i < VALID_STRING_AMOUNT_COUNT; i++) {
        id<IRAmount> amount = [IRAmountFactory amountFromString:VALID_STRING_AMOUNT[i]
                                                          error:nil];

        XCTAssertNotNil(amount);
        XCTAssertEqualObjects(amount.value, VALID_STRING_AMOUNT[i]);
    }
}

- (void)testInvalidStringAmountWithError {
    for (NSUInteger i = 0; i < INVALID_STRING_AMOUNT_COUNT; i++) {
        NSError *error = nil;
        id<IRAmount> amount = [IRAmountFactory amountFromString:INVALID_STRING_AMOUNT[i]
                                                          error:&error];

        XCTAssertNil(amount);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, IRInvalidAmountValue);
    }
}

- (void)testInvalidStringAmountWithoutError {
    for (NSUInteger i = 0; i < INVALID_STRING_AMOUNT_COUNT; i++) {
        id<IRAmount> amount = [IRAmountFactory amountFromString:INVALID_STRING_AMOUNT[i]
                                                          error:nil];

        XCTAssertNil(amount);
    }
}

- (void)testValidIntAmount {
    for (NSUInteger i = 1e3; i < 1e5; i += 1e4) {
        NSError *error = nil;
        id<IRAmount> amount = [IRAmountFactory amountFromUnsignedInteger:i
                                                                   error:&error];

        XCTAssertNotNil(amount);
        XCTAssertNil(error);
    }
}

- (void)testValidStringTransferAmount {
    for (NSUInteger i = 0; i < VALID_STRING_AMOUNT_COUNT; i++) {
        id<IRTransferAmount> amount = [IRAmountFactory transferAmountFromString:VALID_STRING_AMOUNT[i]
                                                                  error:nil];

        XCTAssertNotNil(amount);
        XCTAssertEqualObjects(amount.value, VALID_STRING_AMOUNT[i]);
    }
}

- (void)testValidIntTransferAmount {
    for (NSUInteger i = 1e3; i < 1e5; i += 1e4) {
        NSError *error = nil;
        id<IRTransferAmount> amount = [IRAmountFactory transferAmountFromUnsignedInteger:i
                                                                                   error:&error];

        XCTAssertNotNil(amount);
        XCTAssertNil(error);
    }
}

- (void)testInvalidStringTransferAmountWithError {
    for (NSUInteger i = 0; i < INVALID_STRING_TRANSFER_AMOUNT_COUNT; i++) {
        NSError *error = nil;
        id<IRTransferAmount> amount = [IRAmountFactory transferAmountFromString:INVALID_STRING_TRANSFER_AMOUNT[i]
                                                                          error:&error];

        XCTAssertNil(amount);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, IRInvalidAmountValue);
    }
}

- (void)testInvalidStringTransferAmountWithoutError {
    for (NSUInteger i = 0; i < INVALID_STRING_TRANSFER_AMOUNT_COUNT; i++) {
        id<IRTransferAmount> amount = [IRAmountFactory transferAmountFromString:INVALID_STRING_TRANSFER_AMOUNT[i]
                                                                          error:nil];

        XCTAssertNil(amount);
    }
}

@end
