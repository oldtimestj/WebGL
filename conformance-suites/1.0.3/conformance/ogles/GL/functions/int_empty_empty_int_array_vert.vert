
/*
** Copyright (c) 2012 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/


attribute vec4 gtf_Vertex;
uniform mat4 gtf_ModelViewProjectionMatrix;
varying vec4 color;

// Function declarations.
int function(int par[3]);
bool is_all(const in int array[3], const in int value);
void set_all(out int array[3], const in int value);

void main (void)
{
    int par[3];
    int ret = 0;

    float gray = 0.0;

    // Initialize the entire array to 1.
    set_all(par, 1);

    ret = function(par);

    // The parameter should remain unchanged by the function and the function should return 1.
    if(is_all(par, 1) && (ret == 1))
    {
        gray = 1.0;
    }

    color = vec4(gray, gray, gray, 1.0);
    gl_Position = gtf_ModelViewProjectionMatrix * gtf_Vertex;
}

// Function definitions.
int function(int par[3])
{
    // Return the value of the array.
    if(is_all(par, 1))
    {
        // Test parameter qualifier (default is "in").
        set_all(par, 0);

        return 1;
    }
    else
        return 0;
}

bool is_all(const in int array[3], const in int value)
{
    bool ret = true;

    if(array[0] != value)
        ret = false;
    if(array[1] != value)
        ret = false;
    if(array[2] != value)
        ret = false;

    return ret;
}

void set_all(out int array[3], const in int value)
{
    array[0] = value;
    array[1] = value;
    array[2] = value;
}
