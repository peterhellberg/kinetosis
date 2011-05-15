// Include the Ruby headers and goodies
#include "ruby.h"
#include <IOKit/IOKitLib.h>

// Defining a space for information and references about the module to be stored internally
VALUE Kinetosis = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_kinetosis();

// Prototype for our method 'xyz' - methods are prefixed by 'method_' here
static VALUE method_xyz();

// The initialization method for this module
void Init_kinetosis() {
  Kinetosis = rb_define_module("Kinetosis");
  rb_define_method(Kinetosis, "xyz", method_xyz, 0);	
}

static VALUE method_xyz(){
  struct data {
    signed short x;
    signed short y;
    signed short z;
    char pad[34];
  };

  kern_return_t result;

  mach_port_t masterPort;
  IOMasterPort(MACH_PORT_NULL, &masterPort);
  CFMutableDictionaryRef matchingDictionary = IOServiceMatching("SMCMotionSensor");

  io_iterator_t iterator;
  result = IOServiceGetMatchingServices(masterPort, matchingDictionary, &iterator);

  if(result != KERN_SUCCESS) {
    return rb_str_new2("Error");
  }

  io_object_t device = IOIteratorNext(iterator);
  IOObjectRelease(iterator);
  if(device == 0){
    return rb_str_new2("Error");
  }

  io_connect_t dataPort;
  result = IOServiceOpen(device, mach_task_self(), 0, &dataPort);
  IOObjectRelease(device);

  if(result != KERN_SUCCESS) {
    return rb_str_new2("Error");
  }

  IOItemCount structureInputSize;
  size_t structureOutputSize;

  struct data inputStructure;
  struct data outputStructure;
  structureInputSize = sizeof(struct data);
  structureOutputSize = sizeof(struct data);

  memset(&inputStructure, 1, sizeof(inputStructure));
  memset(&outputStructure, 0, sizeof(outputStructure));

  result = IOConnectCallStructMethod(
    (mach_port_t)dataPort,
    (uint32_t)5,
    (const void*)&inputStructure,
    structureInputSize,
    (void*)&outputStructure,
    &structureOutputSize
  );

  if(result != KERN_SUCCESS) {
    return rb_str_new2("Error");
  }

  IOServiceClose(dataPort);

  VALUE coords = rb_ary_new2(3);
  rb_ary_store(coords, 0, INT2FIX(outputStructure.x));
  rb_ary_store(coords, 1, INT2FIX(outputStructure.y));
  rb_ary_store(coords, 2, INT2FIX(outputStructure.z));

  return coords;
}
