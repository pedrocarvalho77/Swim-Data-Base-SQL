table ATHLETE
(
	_Num_,
	Name,
	Sex,
	BirthDate,
	Phone ?,
	Email,
	Team --> TEAM._Num_,
	JoinDate
)

table PERSONAL_BEST
(
	_Athlete_Num_ --> ATHLETE._Num_,
	_Race_,
	_PoolDistance_,
	_RaceTime_,
	_RaceDate_,
	_City_,
	_Competition_
)

table EMPLOYEE
(
	_Num_,
	Name,
	Sex,
	BirthDate,
	Phone ?,
	Email,
	Team --> TEAM._Num_,
	JoinDate
)

table TEAM
(
	_Num_,
	Name,
	Email,
	Director --> EMPLOYEE._Num_,
	Pool --> POOL._Num_
)

table COMPETITION
(
	_Num_,
	Name,
	Pool_Num --> POOL._Num_,
	CompDate
)

table POOL
(
	_Num_,
	Name,
	AddStreet,
  	AddNum,
  	AddPostalCode,
  	AddTown	
)

table RAN_IN
(
	_Comp_Num_ --> COMPETITION._Num_,
	Athlete_Num --> ATHLETE._Num_,
	CompDate,
	PoolName
)