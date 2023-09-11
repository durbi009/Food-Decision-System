 % LIZBETH DURBIN
% this system will help you 
% decide what to eat based on what ingredients you have 

top :- 
       write('What meat do you have? '),read(Meat),
% options should be beef, pork,tofu ,eggs, turkey, chicken, none
       write('Do you have vegetables? '), read(V),
% options should only be yes or no
       write('What sides do you have? '), read(Side),
% options should be bread, rice, pasta, none
    choose(Meat,V,Side,Food),
% call choose rules to match 
    write('You should eat: '), write(Food),nl.

% choose rules will follow
% I have decidede that for all choose rules the cf will be .50 since this program will give you an option but it is still up to the user whether they want 
% to follow the suggestions or not. Thus .50 represents chance of yes or no 


% 1 if the meat input is beef, no vegetables, with pasta side then  make spaghetti
choose(Meat,V,Side, ' spaghetti'):-
    Meat = beef, V = no, Side = pasta.

% 2 if the meat input is beef, yes vegetables and pasta side then have steak dinner
choose(Meat,V,Side, ' steak dinner') :-
    Meat = beef, V = yes, Side = pasta.

% 3 if the meat input is beef, and the sandwhich subgoal succeeds, make a burger
choose(Meat,V,Side, ' a burger') :-
    Meat = beef, sandwhich(V,Side).

% 4 if the lean_meat subgoal succeeds, yes vegetables and no side, make a salad
choose(Meat,V,Side, ' a salad') :-
    lean_meat(Meat),V = yes, Side = none.

% 5 if the lean_meat subgoal AND th sandwich subgoal succeeds then we make a sandwhich 
choose(Meat,V,Side, ' a sandwhich') :-
    lean_meat(Meat),sandwhich(V,Side).

% 6 if the lean_meat subgoal succeeds and we have vegetables and side = rice then make a healthy one pot skillet
choose(Meat,V,Side, ' healthy one pot skillet') :-
    lean_meat(Meat),V = yes, Side = rice.
 
% 7 if the breakfast subgoal and the sandwich subgoal succeeds then make a breakfast sandwhich 
choose(Meat,V,Side, ' a breakfast sandwhich') :-
    breakfast(Meat,V),sandwhich(V,Side).

% 8 if the breakfast subgoal succeeds but we have no side then we make an omelet
choose(Meat,V,Side, ' an omelet') :-
    breakfast(Meat,V), Side = none.

% 9 if the meat is pork, we have vegetables and side is pasta, make pork chops 
choose(Meat,V,Side, ' pork chops') :-
    Meat = pork, V = yes, Side = pasta.

% 10  if the meat is eggs, we have no vegetables and side = rice, then we make fried rice. 
% breakfast subgoal fails here

choose(Meat,V,Side, ' fried rice') :-
    Meat = eggs, V = no, Side = rice.

% 11 if the meat input is beef and we have no vegetables and no sides, make bone broth (like a soup)

choose(Meat,V,Side, ' bone broth') :-
    Meat = beef, V = no,Side = none.

% 12 if the meat input is tofu and we have vegetables and rice, then make vegan tofu rice bowl.

choose(Meat,V,Side, ' vegan tofu rice bowl') :-
    vegan(Meat,V), rice_bowl(V,Side).

% 13 if the vegan subgoal succeeds and we have no sides, then make vegan stir fry

choose(Meat,V,Side, ' tofu stir fry') :-
    vegan(Meat,V), Side = none .
% 14 if the meat input is pork and the sanwhich subgoal succeeds then we make a blt

choose(Meat,V,Side, ' a BLT') :-
    Meat = pork, sandwhich(V,Side).
 
% 15 if we have no meat input and the rice_bowl subgoal succeeds then we make veggie and rice bowl.
    choose(Meat,V,Side, 'veggie and rice bowl') :-
    Meat = none, rice_bowl(V,Side).


% if all else fails, eat fast food

% 12 
choose(Meat,V,Side,' fast food').

% CF FOR THESE RULES IS .70 BECASUE WHIULE THESE INGREDIENTS CAN BE CLASSIFIED THIS WAY, THERE IS A WIDE RANGE OF THINGS THAT CAN BE MADE WITH THESE 
% COMBINATIONS

% if we have tofu and vegetables, then we make a vegan meal
vegan(Meat,V) :- Meat = tofu,V = yes.
% chicken is classified as a lean meat
lean_meat(Meat) :- Meat = chicken.
% turkey is classified as a lean meat
lean_meat(Meat) :- Meat = turkey.
%if we have eggs and vegetables then what we make can be called breakfast
breakfast(Meat,V) :- Meat = eggs, V = yes.
%if we have vegetables and bread then we can make a sandwhch 
sandwhich(V,Side) :- V = yes, Side = bread. 
% if we have rice and vegetables then we can make a rice bowl
rice_bowl(V,Side) :- V = yes, Side = rice.
