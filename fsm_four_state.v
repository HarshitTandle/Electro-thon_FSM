module fsm_4state (
    input clk,
    input reset,
    output [1:0] state_out  
);


parameter IDLE    = 2'b00;
parameter LOAD    = 2'b01;
parameter PROCESS = 2'b10;
parameter DONE    = 2'b11;

reg [1:0] current_state, next_state;
reg [1:0] state_counter;  


always @(posedge clk or posedge reset) 
begin
    if (reset) 
    begin
        current_state <= IDLE;
        state_counter <= 2'd0;
    end 
    else 
    begin
        if (state_counter == 2'd1) 
        begin
            current_state <= next_state;
            state_counter <= 2'd0;
        end 
        else
        begin
            state_counter <= state_counter + 1;
        end
    end
end


always @(*) 
begin
    case (current_state)
        IDLE:    next_state = LOAD;
        LOAD:    next_state = PROCESS;
        PROCESS: next_state = DONE;
        DONE:    next_state = IDLE;
        
        default: next_state = IDLE;
    endcase
end


assign state_out = current_state;

endmodule

