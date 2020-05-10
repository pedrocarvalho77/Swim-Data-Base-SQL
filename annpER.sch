ATHLETE
(
	_Num_,
	Name,
	Sex,
	BirthDate,
	Phone ?,
	Email,
	{PersonalBest(Race,PoolDistance,RaceTime,RaceDate,City,Competition)}
)

EMPLOYEE
(
	_Num_,
	Name,
	Sex,
	BirthDate,
	Phone ?,
	Email
)

TEAM
(
	_Num_,
	Name,
	Email
)

POOL
(
	_Num_,
	Name,
	AddStreet,
  	AddNum,
  	AddPostalCode,
  	AddTown	
)

COMPETITION
(
	_Num_,
	Name
)

ATHLETE ---N--- <SWIMS_IN (JoinDate)> ===1=== TEAM
EMPLOYEE ===N=== <WORS_FOR (JoinDate)> ===1=== TEAM
EMPLOYEE ---1--- <DIRECTOR_OF> ===1=== TEAM
COMPETITION ===1=== <HAD_PLACE_IN (Date)> ---1--- POOL
ATHLETE ===1=== <RAN_IN (Date,Pool)> ---1--- COMPETITION
TEAM ---M--- <TEAM_HOUSE_IN> ===N=== POOL