if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vmap work work

vlog *.v

vsim -voptargs=+acc work.ASYNC_FIFO_tb

do wave.do
run -all