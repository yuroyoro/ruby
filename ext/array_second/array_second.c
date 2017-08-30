#include <ruby/ruby.h>

/*
 *  call-seq:
 *     ary.second     ->   obj or nil
 *
 *  Returns the second lement of the array.
 *  If the array is empty or only have one element, returns +nil+ .
 *
 *     a = [ "q", "r", "s", "t" ]
 *     a.second     #=> "r"
 *     ["q"].second #=> nil
 */

static VALUE
rb_ary_second(VALUE self)
{
    return rb_ary_entry(self, 1);
}

void
Init_array_second(void)
{
    rb_define_method(rb_cArray, "second", rb_ary_second, 0);
}

