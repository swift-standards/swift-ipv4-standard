// ===----------------------------------------------------------------------===//
//
// Copyright (c) 2025 Coen ten Thije Boonkkamp
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of project contributors
//
// SPDX-License-Identifier: Apache-2.0
//
// ===----------------------------------------------------------------------===//

// IPv4Standard.swift
// swift-ipv4-standard
//
// IPv4 Address Standard Package
//
// This package composes foundational IPv4 specifications into a unified standard.
//
// Current composition:
// - RFC 791: Internet Protocol (IPv4 addressing)
//
// Future extensions:
// - RFC 4632: CIDR (Classless Inter-Domain Routing)
// - RFC 6890: Special-Purpose IP Address Registries

@_exported import RFC_791

/// IPv4 Standard namespace
///
/// This namespace provides a unified interface to IPv4 addressing standards.
/// It composes multiple RFCs into a cohesive whole.
///
/// ## Current Implementation
///
/// - **RFC 791**: Core IPv4 addressing with dotted-decimal notation
///
/// ## Usage
///
/// ```swift
/// import IPv4_Standard
///
/// // Create addresses
/// let address = try IPv4.Address("192.168.1.1")
/// let literal: IPv4.Address = "10.0.0.1"
///
/// // Access octets
/// let (a, b, c, d) = address.octets
///
/// // Serialize
/// print(address.description)  // "192.168.1.1"
/// ```
public enum IPv4Standard {}

/// Convenience typealias for IPv4
///
/// Allows writing `IPv4.Address` instead of `RFC_791.IPv4.Address`
public typealias IPv4 = RFC_791.IPv4
