package axi_transaction;

parameter adr_width   = 32;
parameter data_width  = 32;
parameter max_size    = 128;
parameter max_len     = 256;
parameter size_width  = $clog2 (max_size + 1);
parameter len_width   = $clog2 (max_len  + 1);

typedef logic [adr_width   - 1:0] adr_t;
typedef logic [data_width  - 1:0] data_t;
typedef logic [size_width  - 1:0] size_t;
typedef logic [len_width   - 1:0] len_t;

typedef enum { read, write } op_t;
typedef enum { fixed, incr, wrap } burst_t;

class axi_transaction;

  rand op_t    op;
  rand adr_t   adr;
  rand size_t  size;
  rand len_t   len;
  rand burst_t burst;
  rand data_t  data [];

  constraint size_c
  {
    size inside { 1, 2, 4, 8, 16, 32, 64, 128 };
    size <= data_width / 8;
  }

  constraint len_c
  {
    len == data.size;
    len > 0 && len <= max_len;
  }

  // AXI has the following rules governing the use of bursts:
  // * for wrapping bursts, the burst length must be 2, 4, 8, or 16
  // * a burst must not cross a 4KB address boundary
  
  constraint burst_c
  {
    burst == wrap
      -> len inside { 2, 4, 8, 16 };
  }

  constraint adr_c
  {
    adr % size == 0;
    
    if (burst == incr)
      adr / 4096 == (adr + len - 1) / 4096;
  }

  constraint adr_distr_c
  {
    adr dist
    {
      [            0 :            1 ] := 25,
      [ 32'hffff0000 : 32'hffffffff ] :/ 25,
      [            2 : 32'hfffeffff ] :/ 25
    };
  }

  function string str ();

    string s;

    $sformat (s, "%s adr='h%0h size=%0d len=%0d burst=%s",
              op.name, adr, size, len, burst.name);

    for (int i = 0; i < data.size (); i++)
      s = { s, $sformatf (" 'h%h", data [i]) };

    return s;

  endfunction

endclass

endpackage
