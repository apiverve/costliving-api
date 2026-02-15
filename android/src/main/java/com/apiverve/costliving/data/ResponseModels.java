// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     CostofLivingData data = Converter.fromJsonString(jsonString);

package com.apiverve.costliving.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static CostofLivingData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(CostofLivingData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(CostofLivingData.class);
        writer = mapper.writerFor(CostofLivingData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// CostofLivingData.java

package com.apiverve.costliving.data;

import com.fasterxml.jackson.annotation.*;

public class CostofLivingData {
    private From from;
    private From to;
    private Comparison comparison;

    @JsonProperty("from")
    public From getFrom() { return from; }
    @JsonProperty("from")
    public void setFrom(From value) { this.from = value; }

    @JsonProperty("to")
    public From getTo() { return to; }
    @JsonProperty("to")
    public void setTo(From value) { this.to = value; }

    @JsonProperty("comparison")
    public Comparison getComparison() { return comparison; }
    @JsonProperty("comparison")
    public void setComparison(Comparison value) { this.comparison = value; }
}

// Comparison.java

package com.apiverve.costliving.data;

import com.fasterxml.jackson.annotation.*;

public class Comparison {
    private double costDifference;
    private String direction;
    private SalaryEquivalent salaryEquivalent;

    @JsonProperty("costDifference")
    public double getCostDifference() { return costDifference; }
    @JsonProperty("costDifference")
    public void setCostDifference(double value) { this.costDifference = value; }

    @JsonProperty("direction")
    public String getDirection() { return direction; }
    @JsonProperty("direction")
    public void setDirection(String value) { this.direction = value; }

    @JsonProperty("salaryEquivalent")
    public SalaryEquivalent getSalaryEquivalent() { return salaryEquivalent; }
    @JsonProperty("salaryEquivalent")
    public void setSalaryEquivalent(SalaryEquivalent value) { this.salaryEquivalent = value; }
}

// SalaryEquivalent.java

package com.apiverve.costliving.data;

import com.fasterxml.jackson.annotation.*;

public class SalaryEquivalent {
    private String description;
    private long fromSalary;
    private long equivalentSalary;

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("fromSalary")
    public long getFromSalary() { return fromSalary; }
    @JsonProperty("fromSalary")
    public void setFromSalary(long value) { this.fromSalary = value; }

    @JsonProperty("equivalentSalary")
    public long getEquivalentSalary() { return equivalentSalary; }
    @JsonProperty("equivalentSalary")
    public void setEquivalentSalary(long value) { this.equivalentSalary = value; }
}

// From.java

package com.apiverve.costliving.data;

import com.fasterxml.jackson.annotation.*;

public class From {
    private String searchedLocation;
    private String region;
    private String regionName;
    private long costIndex;

    @JsonProperty("searchedLocation")
    public String getSearchedLocation() { return searchedLocation; }
    @JsonProperty("searchedLocation")
    public void setSearchedLocation(String value) { this.searchedLocation = value; }

    @JsonProperty("region")
    public String getRegion() { return region; }
    @JsonProperty("region")
    public void setRegion(String value) { this.region = value; }

    @JsonProperty("regionName")
    public String getRegionName() { return regionName; }
    @JsonProperty("regionName")
    public void setRegionName(String value) { this.regionName = value; }

    @JsonProperty("costIndex")
    public long getCostIndex() { return costIndex; }
    @JsonProperty("costIndex")
    public void setCostIndex(long value) { this.costIndex = value; }
}