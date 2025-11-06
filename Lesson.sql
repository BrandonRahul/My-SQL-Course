SELECT 
    PS.PatientID
    ,PS.Hospital
    ,PS.Ward
    ,PS.AdmittedDate
    ,PS.DischargeDate
    ,DATEADD(WEEK, -2, PS.AdmittedDate) AS Reminder
    ,DATEDIFF(DAY, PS.AdmittedDate, PS.DischargeDate) AS DaysInHospital
FROM PatientStay AS PS

WHERE PS.Hospital IN ('Kingston', 'PRUH')
ORDER BY PS.PatientId DESC

SELECT * FROM DimHospitalBad

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.DischargeDate
    ,h.HospitalType
    ,ps.Hospital
    ,h.Hospital
FROM PatientStay ps RIGHT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital
