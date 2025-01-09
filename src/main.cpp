#include <iostream>
#include <vector>
#include <random>
#include <boost/math/distributions/binomial.hpp>
using boost::math::binomial;
#include <emscripten/bind.h>
// empirical_cumulative_distribution_function
using namespace emscripten;

// template<unsigned int N> 
// struct Factorial {
//   static constexpr unsigned int value = N * Factorial<N - 1>::value;
// };

// // Base case via template specialization:
// template<>
// struct Factorial<0> {
//   static constexpr unsigned int value = 1;
// };

// EMSCRIPTEN_BINDINGS(my_module) {
//     constant("Factorial_10", Factorial<10>::value);  // not constant
// }

double random_boost_stuff() {
    // using boost::math::empirical_cumulative_distribution_function;
    // std::random_device rd;
    // std::mt19937 gen{rd()};
    // std::normal_distribution<double> dis(0, 1);
    // size_t n = 128;
    // std::vector<double> v(n);
    // for (size_t i = 0; i < n; ++i) {
    //     v[i] = dis(gen);
    // }

    // auto ecdf = empirical_cumulative_distribution_function(std::move(v));
    // return ecdf(0.0);
    const double success_fraction = 0.5; // = 50% = 1/2 for a 'fair' coin.
    int flips = 10;
    binomial flip(flips, success_fraction);
    return (double)mean(flip);
}


#ifndef __EMSCRIPTEN__  
int main() {
    std::cout << "Result ecdf(0.0): " << random_boost_stuff() << std::endl;
    return 0;
}
#else  /*_EMSCRIPTEN_*/
    EMSCRIPTEN_BINDINGS(my_module) {
        function("random_boost_stuff", &random_boost_stuff);
    }
#endif
