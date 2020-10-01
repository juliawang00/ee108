module verifier (
  input wire [63:0] username, 
  input wire [63:0] password, 
  output wire valid
);

  wire[3:0] length_finder_out_pass, length_finder_out_user;
	wire[31:0] hasher_out, pass_rom_out;
	wire[2:0] user_cam_out;
	wire user_cam_valid, test_password;

	length_finder LFPASS(.string(password), .length(length_finder_out_pass));
	length_finder LFUSER(.string(username), .length(length_finder_out_user));
	
	hasher HASH(.data_len(length_finder_out_pass), .data(password), .hash(hasher_out));
	cam USERCAM(.data_len(length_finder_out_user), .data(username), .addr(user_cam_out), .valid(user_cam_valid));

	hash_rom passROM(.addr(user_cam_out), .data(pass_rom_out));
	assign valid = (hasher_out == pass_rom_out) & user_cam_valid;
endmodule
