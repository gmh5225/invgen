// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.10;

/**
 * @title Exponential module for storing fixed-precision decimals
 * @author Compound
 * @notice Exp is a struct which stores decimals with a fixed precision of 18 decimal places.
 *         Thus, if we wanted to store the 5.1, mantissa would store 5.1e18. That is:
 *         `Exp({mantissa: 5100000000000000000})`.
 */
contract ExponentialNoError {
    uint constant expScale = 1e18;
    uint constant doubleScale = 1e36;
    uint constant halfExpScale = expScale/2;
    uint constant mantissaOne = expScale;

    struct Exp {
        uint mantissa;
    }

    struct Double {
        uint mantissa;
    }

    /**
     * @dev Truncates the given exp to a whole number value.
     *      For example, truncate(Exp{mantissa: 15 * expScale}) = 15
     */
    function truncate(Exp memory exp) pure internal returns (uint) {
        // Note: We are not using careful math here as we're performing a division that cannot fail
        return exp.mantissa / expScale;
    }

    /**
     * @dev Multiply an Exp by a scalar, then truncate to return an unsigned integer.
     */
    function mul_ScalarTruncate(Exp memory a, uint scalar) pure internal returns (uint) {
        Exp memory product = mul_exp_int(a, scalar);
        return truncate(product);
    }

    /**
     * @dev Multiply an Exp by a scalar, truncate, then add an to an unsigned integer, returning an unsigned integer.
     */
    function mul_ScalarTruncateAddUInt(Exp memory a, uint scalar, uint addend) pure internal returns (uint) {
        Exp memory product = mul_exp_int(a, scalar);
        return add_int_int(truncate(product), addend);
    }

    /**
     * @dev Checks if first Exp is less than second Exp.
     */
    function lessThanExp(Exp memory left, Exp memory right) pure internal returns (bool) {
        return left.mantissa < right.mantissa;
    }

    /**
     * @dev Checks if left Exp <= right Exp.
     */
    function lessThanOrEqualExp(Exp memory left, Exp memory right) pure internal returns (bool) {
        return left.mantissa <= right.mantissa;
    }

    /**
     * @dev Checks if left Exp > right Exp.
     */
    function greaterThanExp(Exp memory left, Exp memory right) pure internal returns (bool) {
        return left.mantissa > right.mantissa;
    }

    /**
     * @dev returns true if Exp is exactly zero
     */
    function isZeroExp(Exp memory value) pure internal returns (bool) {
        return value.mantissa == 0;
    }

    function safe224(uint n, string memory errorMessage) pure internal returns (uint224) {
        require(n < 2**224, errorMessage);
        return uint224(n);
    }

    function safe32(uint n, string memory errorMessage) pure internal returns (uint32) {
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function add_exp_exp(Exp memory a, Exp memory b) pure internal returns (Exp memory) {
        return Exp({mantissa: add_int_int(a.mantissa, b.mantissa)});
    }

    function add_double_double(Double memory a, Double memory b) pure internal returns (Double memory) {
        return Double({mantissa: add_int_int(a.mantissa, b.mantissa)});
    }

    function add_int_int(uint a, uint b) pure internal returns (uint) {
        return a + b;
    }

    function sub_exp_exp(Exp memory a, Exp memory b) pure internal returns (Exp memory) {
        return Exp({mantissa: sub_int_int(a.mantissa, b.mantissa)});
    }

    function sub_double_double(Double memory a, Double memory b) pure internal returns (Double memory) {
        return Double({mantissa: sub_int_int(a.mantissa, b.mantissa)});
    }

    function sub_int_int(uint a, uint b) pure internal returns (uint) {
        return a - b;
    }

    function mul_exp_exp(Exp memory a, Exp memory b) pure internal returns (Exp memory) {
        return Exp({mantissa: mul_int_int(a.mantissa, b.mantissa) / expScale});
    }

    function mul_exp_int(Exp memory a, uint b) pure internal returns (Exp memory) {
        return Exp({mantissa: mul_int_int(a.mantissa, b)});
    }

    function mul_int_exp(uint a, Exp memory b) pure internal returns (uint) {
        return mul_int_int(a, b.mantissa) / expScale;
    }

    function mul_double_double(Double memory a, Double memory b) pure internal returns (Double memory) {
        return Double({mantissa: mul_int_int(a.mantissa, b.mantissa) / doubleScale});
    }

    function mul_double_int(Double memory a, uint b) pure internal returns (Double memory) {
        return Double({mantissa: mul_int_int(a.mantissa, b)});
    }

    function mul_int_double(uint a, Double memory b) pure internal returns (uint) {
        return mul_int_int(a, b.mantissa) / doubleScale;
    }

    function mul_int_int(uint a, uint b) pure internal returns (uint) {
        return a * b;
    }

    function div_exp_exp(Exp memory a, Exp memory b) pure internal returns (Exp memory) {
        return Exp({mantissa: div_int_int(mul_int_int(a.mantissa, expScale), b.mantissa)});
    }

    function div_exp_int(Exp memory a, uint b) pure internal returns (Exp memory) {
        return Exp({mantissa: div_int_int(a.mantissa, b)});
    }

    function div_int_exp(uint a, Exp memory b) pure internal returns (uint) {
        return div_int_int(mul_int_int(a, expScale), b.mantissa);
    }

    function div_double_double(Double memory a, Double memory b) pure internal returns (Double memory) {
        return Double({mantissa: div_int_int(mul_int_int(a.mantissa, doubleScale), b.mantissa)});
    }

    function div_double_int(Double memory a, uint b) pure internal returns (Double memory) {
        return Double({mantissa: div_int_int(a.mantissa, b)});
    }

    function div_int_double(uint a, Double memory b) pure internal returns (uint) {
        return div_int_int(mul_int_int(a, doubleScale), b.mantissa);
    }

    function div_int_int(uint a, uint b) pure internal returns (uint) {
        return a / b;
    }

    function fraction(uint a, uint b) pure internal returns (Double memory) {
        return Double({mantissa: div_int_int(mul_int_int(a, doubleScale), b)});
    }
}