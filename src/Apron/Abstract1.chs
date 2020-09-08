{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Apron.Environment
import           Foreign
import           Foreign.C

#include "ap_abstract1.h"

{# import Apron.Manager #}
{# import Apron.Environment #}
{# import Apron.Lincons1 #}
{# import Apron.Linexpr1 #}
{# import Apron.Texpr1 #}
{# import Apron.Tcons1 #}
{# import Apron.Interval #}
{# import Apron.Var #}
 
{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}

-- Memory

-- ap_abstract1_t ap_abstract1_copy(ap_manager_t* man, ap_abstract1_t* a);

{#fun ap_abstract1_clear as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_size as ^ { `Manager', `Abstract1' } -> `CULong' #}

-- Control of internal representation

{#fun ap_abstract1_minimize as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_canonicalize as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_hash as ^ { `Manager', `Abstract1' } -> `Int' #}

{#fun ap_abstract1_approximate as ^ { `Manager', `Abstract1', `Int' } -> `()' #}

-- Basic constructors ALL NEED WRAPPERS

-- Accessors

{#fun ap_abstract1_environment as ^ { `Manager', `Abstract1' } -> `Environment' #}

-- Tests

{#fun ap_abstract1_is_bottom as ^ { `Manager', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_top as ^ { `Manager', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_leq as ^ { `Manager', `Abstract1', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_eq as ^ { `Manager', `Abstract1', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_sat_lincons as ^ { `Manager', `Abstract1', `Lincons1' } -> `Bool' #}

{#fun ap_abstract1_sat_tcons as ^ { `Manager', `Abstract1', `Tcons1' } -> `Bool' #}

{#fun ap_abstract1_sat_interval as ^ { `Manager', `Abstract1', %`Var', `Interval' } -> `Bool' #}

{#fun ap_abstract1_is_variable_unconstrained as ^ { `Manager', `Abstract1', %`Var' } -> `Bool' #}
                                                                   
-- Extraction of properties

{#fun ap_abstract1_bound_linexpr as ^ { `Manager', `Abstract1', `Linexpr1' } -> `Interval' #}

{#fun ap_abstract1_bound_texpr as ^ { `Manager', `Abstract1', `Texpr1' } -> `Interval' #}

{#fun ap_abstract1_bound_variable as ^ { `Manager', `Abstract1', %`Var' } -> `Interval' #}

-- ap_lincons1_array_t ap_abstract1_to_lincons_array(ap_manager_t* man, ap_abstract1_t* a);

-- ap_tcons1_array_t ap_abstract1_to_tcons_array(ap_manager_t* man, ap_abstract1_t* a);

-- ap_box1_t ap_abstract1_to_box(ap_manager_t* man, ap_abstract1_t* a);

-- Operations

-- ap_abstract1_t ap_abstract1_meet(ap_manager_t* man, bool destructive, ap_abstract1_t* a1, ap_abstract1_t* a2);

-- ap_abstract1_t ap_abstract1_join(ap_manager_t* man, bool destructive, ap_abstract1_t* a1, ap_abstract1_t* a2);

-- ap_abstract1_t ap_abstract1_meet_array(ap_manager_t* man, ap_abstract1_t* tab, size_t size);

-- ap_abstract1_t ap_abstract1_join_array(ap_manager_t* man, ap_abstract1_t* tab, size_t size);

-- ap_abstract1_t ap_abstract1_meet_lincons_array(ap_manager_t* man,

-- ap_abstract1_meet_tcons_array(ap_manager_t* man,

-- ap_abstract1_t ap_abstract1_add_ray_array(ap_manager_t* man,

-- Assignments and substitutions ALL NEED WRAPPERS

-- EVERYTHING BEYOND THIS POINT NEEDS A WRAPPER



