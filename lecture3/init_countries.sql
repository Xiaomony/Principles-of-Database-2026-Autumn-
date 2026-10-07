CREATE TABLE IF NOT EXISTS countries (
    country_code char(2),
    PRIMARY KEY (country_code),
    country_name varchar(30),
    continent varchar(10)
);

INSERT INTO countries
VALUES ('ae', 'United Arab Emirates', 'ASIA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('af', 'Afghanistan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('al', 'Albania', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('am', 'Armenia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ao', 'Angola', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ar', 'Argentina', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('at', 'Austria', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('au', 'Australia', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('az', 'Azerbaijan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('ba', 'Bosnia and Herzegovina', 'EUROPE')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bb', 'Barbados', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bd', 'Bangladesh', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('be', 'Belgium', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bf', 'Burkina Faso', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bg', 'Bulgaria', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bh', 'Bahrain', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bi', 'Burundi', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bj', 'Benin', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bm', 'Bermuda', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bn', 'Brunei', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bo', 'Bolivia', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('br', 'Brazil', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bs', 'Bahamas', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bt', 'Bhutan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bw', 'Botswana', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('by', 'Belarus', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('bz', 'Belize', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ca', 'Canada', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('cd', 'Congo Kinshasa', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES
    ('cf', 'Central African Republic', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('cg', 'Congo Brazzaville', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ch', 'Switzerland', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('ci', 'Cote d''Ivoire', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('ck', 'Cook Islands', 'OCEANIA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cl', 'Chile', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cm', 'Cameroon', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cn', 'China', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('co', 'Colombia', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cr', 'Costa Rica', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cu', 'Cuba', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('cy', 'Cyprus', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('cz', 'Czech Republic', 'EUROPE')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('de', 'Germany', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('dj', 'Djibouti', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('dk', 'Denmark', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('dm', 'Dominica', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('do', 'Dominican Republic', 'AMERICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('dz', 'Algeria', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ec', 'Ecuador', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ee', 'Estonia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('eg', 'Egypt', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('er', 'Eritrea', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('et', 'Ethiopia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('fi', 'Finland', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('fj', 'Fiji', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('fm', 'Micronesia', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('fr', 'France', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ga', 'Gabon', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('gb', 'United Kingdom', 'EUROPE')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gd', 'Grenada', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ge', 'Georgia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gh', 'Ghana', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gm', 'Gambia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gn', 'Guinea', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('gq', 'Equatorial Guinea', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gr', 'Greece', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gt', 'Guatemala', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('gw', 'Guinea-Bissau', 'AFRICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('gy', 'Guyana', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('hk', 'Hong Kong', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('hn', 'Honduras', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('hr', 'Croatia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ht', 'Haiti', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('hu', 'Hungary', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('id', 'Indonesia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ie', 'Ireland', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('il', 'Israel', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('in', 'India', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('iq', 'Iraq', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ir', 'Iran', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('is', 'Iceland', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('it', 'Italy', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('jm', 'Jamaica', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('jo', 'Jordan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('jp', 'Japan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ke', 'Kenya', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kg', 'Kyrgyzstan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kh', 'Cambodia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('km', 'Comoros', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kp', 'North Korea', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kr', 'South Korea', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kw', 'Kuwait', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('kz', 'Kazakhstan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('la', 'Laos', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lb', 'Lebanon', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lk', 'Sri Lanka', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lr', 'Liberia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ls', 'Lesotho', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lt', 'Lithuania', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lu', 'Luxembourg', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('lv', 'Latvia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ly', 'Libya', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ma', 'Morocco', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('md', 'Moldova', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('me', 'Montenegro', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mg', 'Madagascar', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mk', 'Macedonia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ml', 'Mali', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mm', 'Myanmar', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mn', 'Mongolia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mr', 'Mauritania', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mt', 'Malta', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mu', 'Mauritius', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mv', 'Maldives', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mw', 'Malawi', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mx', 'Mexico', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('my', 'Malaysia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('mz', 'Mozambique', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('na', 'Namibia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ne', 'Niger', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ng', 'Nigeria', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ni', 'Nicaragua', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('nl', 'Netherlands', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('no', 'Norway', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('np', 'Nepal', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('nz', 'New Zealand', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('om', 'Oman', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pa', 'Panama', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pe', 'Peru', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('pg', 'Papua New Guinea', 'OCEANIA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ph', 'Philippines', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pk', 'Pakistan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pl', 'Poland', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pr', 'Puerto Rico', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('pt', 'Portugal', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('py', 'Paraguay', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('qa', 'Qatar', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ro', 'Romania', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('rs', 'Serbia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ru', 'Russia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('rw', 'Rwanda', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sa', 'Saudi Arabia', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('sb', 'Solomon Islands', 'OCEANIA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sc', 'Seychelles', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sd', 'Sudan', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('se', 'Sweden', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sg', 'Singapore', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('si', 'Slovenia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sk', 'Slovakia', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sl', 'Sierra Leone', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sn', 'Senegal', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('so', 'Somalia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sp', 'Spain', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sr', 'Suriname', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ss', 'South Sudan', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sv', 'El Salvador', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sy', 'Syria', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('sz', 'Swaziland', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('td', 'Chad', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tg', 'Togo', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('th', 'Thailand', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tj', 'Tajikistan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tk', 'Tokelau', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tl', 'Timor-Leste', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tm', 'Turkmenistan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tn', 'Tunisia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('to', 'Tonga', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tr', 'Turkey', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('tt', 'Trinidad and Tobago', 'AMERICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tv', 'Tuvalu', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tw', 'Taiwan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('tz', 'Tanzania', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ua', 'Ukraine', 'EUROPE') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ug', 'Uganda', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries
VALUES ('us', 'United States', 'AMERICA')
ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('uy', 'Uruguay', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('uz', 'Uzbekistan', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ve', 'Venezuela', 'AMERICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('vn', 'Vietnam', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('vu', 'Vanuatu', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ws', 'Samoa', 'OCEANIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('ye', 'Yemen', 'ASIA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('za', 'South Africa', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('zm', 'Zambia', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
INSERT INTO countries VALUES ('zw', 'Zimbabwe', 'AFRICA') ON CONFLICT (country_code) DO NOTHING;
