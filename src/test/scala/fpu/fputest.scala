package fpu

import chisel3._
import chiseltest._
import hardfloat._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.util._

class FloatMulTestSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "FloatMulTest"
  it should "get right results" in {
    test(new FPU(expWidth = 8, sigWidth = 24)) { dut =>
      val a = BigInt("4015C28F", 16)
      val b = BigInt("40B570A3", 16)

      dut.io.a.bits.poke(a.U)
      dut.io.b.bits.poke(b.U)
      dut.clock.step(1)

      val result = BigInt("415448E7", 16)
      dut.io.out.bits.expect(result.U)
    }
  }
}