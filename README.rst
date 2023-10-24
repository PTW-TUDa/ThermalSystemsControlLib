Thermal Systems Control Library (TSCL)
======================================

The transformation of energy-intensive industries towards greenhouse gas neutrality leads to increasing complexity of industrial energy supply systems. This affects particularly thermal energy systems due to waste heat utilization measures as well as the integration of renewable energy sources and further storage capacities. This complexity is also reflected in the control strategies of such systems, which makes the development of dynamic simulation models for testing them a research field of growing interest.
The *ThermalSystemsControlLibrary (TSCL)*, developed by the team of the `ETA-Fabrik <https://www.ptw.tu-darmstadt.de>`_ at Technical University of Darmstadt, is a novel Modelica library, which aims at standardized modeling of industrial energy supply systems for control strategy development. Based on a generic data model, all components cover physical as well as control modeling and are particularly suitable for testing supervisory control strategies within external frameworks using the FMI standard. The library is validated for an exemplary use case of an industrial energy supply system. Full Documentation can be found within the libray.

You can find the `source code on github <https://github.com/PTW-TUDa/ThermalSystemsControlLib/>`_. If you would like to contribute, please check our `working repository <https://git.ptw.maschinenbau.tu-darmstadt.de/eta-fabrik/public/thermalsystemscontrollib/>`_.

Library structure
-----------------

The library *TSCL* consists of three main packages:

- The **UsersGuide** package holds main information (e.g. acknowledgements, contact and license information, references).
- The **BaseClasses** package has two main sub-packages and some additional helper packages. The models within *AutomationBaseClasses* implement the introduced control       templates and enable modeling according to our standardized data model for control strategy development. *FluidBaseClasses* holds partial models for physical modeling.
- The **Components** package holds several component models for industrial energy systems. They are structured within packages and strictly distinguished in physical as well as control models.
- The **Applications** package holds an examplary system model of the industrial energy supply system of the ETA Research factory. The package structure may serve as best practice example for how to use the *TSCL*. It consists of several sub-packages. The *Record* package holds system-specific parameters within records that are used for parameterizing component models. The *Systems* package holds system models of multiple components (e.g. gas boiler with pump and valve). The *ThermalNetworks* package may contain models of different thermal networks (e.g. hot water network, cooling water network) and combine several system models. A *Strategies* package may hold models for supervisory control strategies.

Citing this project
--------------------

Please cite this project using our publication:

.. code-block::

    Borst, F., Frank, M. G., Theisinger, L., Weigold, M.
    ThermalSystemsControlLibrary: A Modelica Library for Developing Control Strategies of Industrial Energy Systems.
    Modelica Conference 2023, Aachen, Germany, 2023. [DOI will be added]
