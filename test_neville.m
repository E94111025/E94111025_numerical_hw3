function test_neville()

    x = [-0.440818; -0.270320; -0.106531; 0.0511884];
    f = [0.3; 0.4; 0.5; 0.6];

    x0 = 0;

    [p, Q] = neville(x0, x, f);

    fprintf('插值結果: %.15f\n', p);

    disp('Neville 插值表:')
    disp(Q)
end
