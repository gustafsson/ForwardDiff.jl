module ForwardDiff
    
    if VERSION < v"0.4-"
        warn("ForwardDiff.jl is only officially compatible with Julia v0.4-. You're currently running Julia $VERSION.")
    end

    import Calculus
    import NaNMath
    import Base: *, /, +, -, ^,
                 hash, ==, isequal, copy,
                 zero, one, rand, convert,
                 promote_rule, read, write,
                 isless, isreal, isnan, isfinite,
                 eps, conj, transpose, ctranspose,
                 eltype, abs, abs2
    # Import fad_supported_univar_funcs - use the below commented-out
    # loop to do auto-gen these imports once
    # https://github.com/jakebolewski/JuliaParser.jl/issues/19
    # is fixed.
    import Base: sqrt, cbrt, abs2, inv, log, log10,
                 log2, log1p, exp, exp2, expm1, sin,
                 cos, tan, sec, csc, cot, sind, cosd,
                 tand, secd, cscd, cotd, asin, acos,
                 atan, asec, acsc, acot, asind, acosd,
                 atand, asecd, acscd, acotd, sinh, cosh,
                 tanh, sech, csch, coth, asinh, acosh,
                 atanh, asech, acsch, acoth, erf, erfc,
                 erfi, gamma, lgamma, digamma, trigamma,
                 airy, airyprime, airyai, airybi, airyaiprime,
                 airybiprime, besselj0, besselj1, bessely0, bessely1

    const fad_supported_univar_funcs = map(first, Calculus.symbolic_derivatives_1arg())

    # for fsym in fad_supported_univar_funcs
    #     @eval import Base.$(fsym);
    # end

    include("tuple_funcs.jl")
    include("ForwardDiffNum.jl")
    include("GradientNum.jl")
    include("HessianNum.jl")
    include("TensorNum.jl")
    include("fad_api.jl")
    include("deprecated.jl")

    export wrt,
           derivative!,
           derivative,
           gradient!,
           gradient,
           jacobian!,
           jacobian,
           hessian!,
           hessian,
           tensor!,
           tensor

end # module ForwardDiff
