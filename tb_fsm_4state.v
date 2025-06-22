module tb_fsm_4state;

    
    reg clk;
    reg reset;
    wire [1:0] state_out;

    fsm_4state uut (
        .clk(clk),
        .reset(reset),
        .state_out(state_out)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        reset = 1;
        #12;
        reset = 0;

        #400;

        $finish;
    end

    
    initial begin
        $display("Time    State");
        $monitor("%0d      %b", $time, state_out);
    end

endmodule
