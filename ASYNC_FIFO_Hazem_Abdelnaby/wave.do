onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TB signals} -color Gold /ASYNC_FIFO_tb/W_CLK_tb
add wave -noupdate -expand -group {TB signals} -color {Medium Blue} /ASYNC_FIFO_tb/R_CLK_tb
add wave -noupdate -expand -group {TB signals} /ASYNC_FIFO_tb/W_RST_tb
add wave -noupdate -expand -group {TB signals} /ASYNC_FIFO_tb/R_RST_tb
add wave -noupdate -expand -group {TB signals} -radix hexadecimal /ASYNC_FIFO_tb/WR_DATA_tb
add wave -noupdate -expand -group {TB signals} /ASYNC_FIFO_tb/W_INC_tb
add wave -noupdate -expand -group {TB signals} /ASYNC_FIFO_tb/R_INC_tb
add wave -noupdate -expand -group {TB signals} -radix hexadecimal /ASYNC_FIFO_tb/RD_DATA_tb
add wave -noupdate -expand -group {TB signals} -color Red /ASYNC_FIFO_tb/FULL_tb
add wave -noupdate -expand -group {TB signals} -color {Dark Orchid} /ASYNC_FIFO_tb/EMPTY_tb
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/wptr
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/rptr
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/wptr_sync
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/rptr_sync
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/waddr
add wave -noupdate -expand -group {Design signals} -radix unsigned /ASYNC_FIFO_tb/DUT/raddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21110 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {591798 ps}
