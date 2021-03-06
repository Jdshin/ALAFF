function [ A_out ] = ApplyPtilde_unb( A, p )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ pT, ...
    pB ] = FLA_Part_2x1( p, ...
                         0, 'FLA_TOP' );

  while ( size( pT, 1 ) < size( p, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ p0, ...
      pi1, ...
      p2 ] = FLA_Repart_2x1_to_3x1( pT, ...
                                    pB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    if ( pi1 ~= 0 )    
        tmp = a1t;
        a1t = A2( pi1, : );
        A2( pi1, : ) = tmp;
    end

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ pT, ...
      pB ] = FLA_Cont_with_3x1_to_2x1( p0, ...
                                       pi1, ...
                                       p2, ...
                                       'FLA_TOP' );

  end

  A_out = [ AT
            AB ];

return
